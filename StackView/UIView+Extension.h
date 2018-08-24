//
//  UIView+Extension.h
//  StackView
//
//  Created by Yang on 2018/8/24.
//  Copyright © 2018年 YZW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property(assign,nonatomic) CGFloat x; //x坐标

@property(assign,nonatomic) CGFloat y; //y坐标

@property(assign,nonatomic) CGFloat width; //宽度

@property(assign,nonatomic) CGFloat height; //高度

@property(assign,nonatomic) CGFloat centerX; //中心点X值

@property(assign,nonatomic) CGFloat centerY; //中心点Y值

@property(nonatomic,assign) CGSize size;

@end
