//
//  ZWStackCardView.m
//  StackView
//
//  Created by Yang on 2018/8/24.
//  Copyright © 2018年 YZW. All rights reserved.
//

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#import "ZWStackCardView.h"

@interface ZWStackCardView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ZWStackCardView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 5.0;
        self.clipsToBounds = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleClick)];
        [self addGestureRecognizer:tap];
        
        // 显示index标题
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 1, frame.size.width, 63)];
        _titleLabel.backgroundColor = randomColor;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = 1;
       
        
        [self addSubview:_titleLabel];
        
        UITableView *tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, frame.size.width, frame.size.height - 65)];
        tabelView.delegate = self;
        tabelView.dataSource = self;
        [self addSubview:tabelView];
    }
    return self;
}
- (void)titleClick {
    if ([self.delegate respondsToSelector:@selector(cardViewBecomeUppermostWith:)]) {
        [self.delegate cardViewBecomeUppermostWith:self.index];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (void)setIndex:(NSInteger)index {
    _index = index;
    _titleLabel.text = [NSString stringWithFormat:@"Index:%ld",index];
}
@end
