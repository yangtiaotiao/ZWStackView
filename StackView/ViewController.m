//
//  ViewController.m
//  StackView
//
//  Created by Yang on 2018/8/24.
//  Copyright © 2018年 YZW. All rights reserved.
//

#import "ViewController.h"
#import "ZWStackContentView.h"
#import "ZWStackCardView.h"
#import "UIView+Extension.h"

@interface ViewController ()

@property (nonatomic, strong) ZWStackContentView *stackContentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _stackContentView = [[ZWStackContentView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 100)];
    [self.view addSubview:_stackContentView];
}

// 添加新CardView
- (IBAction)addAction:(UIButton *)sender {
   
    ZWStackCardView *newCard = [[ZWStackCardView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 500)];
    [_stackContentView addNewCardView:newCard];
}

// 移除最上层CardView
- (IBAction)reduceAction:(UIButton *)sender {
    
    [_stackContentView removeCardViewFromIndex:0];
}

@end
