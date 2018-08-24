//
//  ZWStackContentView.m
//  StackView
//
//  Created by Yang on 2018/8/24.
//  Copyright © 2018年 YZW. All rights reserved.
//

#import "ZWStackContentView.h"
#import "ZWStackCardView.h"
#import "UIView+Extension.h"

#define kMain_HEIGTH [UIScreen mainScreen].bounds.size.height
#define kMain_WIDTH [UIScreen mainScreen].bounds.size.width

#define OFFSETY 28

@interface ZWStackContentView()<UIScrollViewDelegate,ZWStackCardViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *contentView;
// 存储card
@property (nonatomic, strong) NSMutableArray<ZWStackCardView *> *cardList;

@property (nonatomic, assign) NSInteger countOfCard;

@property (nonatomic, assign) Boolean IsMaxDargging;
@end

@implementation ZWStackContentView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    self.backgroundColor = [UIColor blackColor];
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, OFFSETY, self.width, self.height - 50)];
    _contentView.backgroundColor = [UIColor blackColor];
    self.scrollView.contentSize = CGSizeMake(self.width, self.height + OFFSETY);
    self.scrollView.contentOffset = CGPointMake(0, OFFSETY);
    [self.scrollView addSubview:_contentView];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //获取scrollView的拖拽手势
    UIPanGestureRecognizer *pan = scrollView.panGestureRecognizer;
    //获取到拖拽的速度（ >0 向下拖动 <0 向上拖动  =0停止拖拽）
    CGFloat velocity = [pan velocityInView:scrollView].y;
    if (velocity < -5.0) { //向上拖动
        _IsMaxDargging = NO;
        [self updateLayout];
    } else if (velocity > 5.0) { //向下拖拽
        if (_IsMaxDargging) {
            return;
        }
        CGFloat offH = OFFSETY - scrollView.contentOffset.y;
        if (offH < 10.0 ) { // 拖动偏移过小不执行动画
            return;
        } else if ( offH > OFFSETY ) { // scrollview弹簧效果超过最大偏移时
            offH = OFFSETY;
            _IsMaxDargging = YES;
        }
        [self updateLayoutWhenDidScrollAtContentOffset:offH];
    }
}

- (void)updateLayoutWhenDidScrollAtContentOffset:(CGFloat)offH {
    
    CGFloat sc = 55;
    [_cardList enumerateObjectsUsingBlock:^(UIView *card, NSUInteger idx, BOOL *stop) {
        
        CGFloat positionY = sc * idx * offH/OFFSETY;
        
        CGFloat scale = 1 - 0.03 * (self.countOfCard - idx);
        [UIView animateWithDuration:0.3 animations:^{
            card.alpha = 1;
            card.layer.transform = CATransform3DMakeScale(scale, scale, 1);
            card.y = positionY;
        }];
        
    }];
}

// 更新scrollView - ContentSize
- (void)updateLayout {
    [self.scrollView setContentOffset:CGPointMake(0, OFFSETY) animated:YES];
    [_cardList enumerateObjectsUsingBlock:^(UIView * card, NSUInteger idx, BOOL *stop) {
        
        CGFloat positionY = OFFSETY * idx ;
        CGFloat alpha = 1 - 0.08 * (self.countOfCard - idx - 1);
        CGFloat scale = 1 - 0.08 * (self.countOfCard - idx - 1);
        [UIView animateWithDuration:0.2 animations:^{

            card.alpha = alpha;
            card.layer.transform = CATransform3DMakeScale(scale, scale, 1);
            card.y = positionY;
        }];
        
    }];
}

- (void)addNewCardView:(ZWStackCardView *)cardView {
    self.scrollView.contentOffset = CGPointMake(0, OFFSETY);
    cardView.frame = CGRectMake(0, 500, kMain_WIDTH, 500);
    
    [UIView animateWithDuration:0.5 animations:^{
        cardView.y = 0;
    }];
    [self.contentView addSubview:cardView];
    cardView.index = _countOfCard;
    _countOfCard += 1;
    cardView.delegate = self;
  
    [self.cardList addObject:cardView];
    [self updateLayout];
}
- (void)removeCardViewFromIndex:(NSInteger)index {
    
    self.scrollView.contentOffset = CGPointMake(0, OFFSETY);
    UIView *card = [_cardList lastObject];
    
    [UIView animateWithDuration:0.8 animations:^{
        card.y = kMain_HEIGTH;
        card.alpha = 0.2;
    } completion:^(BOOL finished) {
        [card removeFromSuperview];
    }];
    
    self.countOfCard -= 1;
    [self.cardList removeLastObject];
    
    [self updateLayout];
}

// 指定哪张卡到最上面
- (void)cardViewBecomeUppermostWith:(NSInteger)index {
    for (NSUInteger i = index+1; i<_countOfCard; i++) {
        ZWStackCardView *card = [_cardList objectAtIndex:i];
        [UIView animateWithDuration:0.5 animations:^{
            card.y = 300;
            card.alpha = 0;
        } completion:^(BOOL finished) {
            [card removeFromSuperview];
        }];
    }
    [_cardList removeObjectsInRange:NSMakeRange(index+1, _countOfCard - index -1)];
    _countOfCard = _cardList.count;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self updateLayout];
    });
}

#pragma mark - lazyLoad
- (NSMutableArray<ZWStackCardView *> *)cardList {
    if (!_cardList) {
        _cardList = [[NSMutableArray alloc] init];
    }
    return _cardList;
}
@end

