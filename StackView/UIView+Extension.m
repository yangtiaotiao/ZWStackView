//
//  UIView+Extension.m
//  StackView
//
//  Created by Yang on 2018/8/24.
//  Copyright © 2018年 YZW. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

//x
-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    
}
-(CGFloat)x{
    return self.frame.origin.x;
}

//y
-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
-(CGFloat)y{
    return self.frame.origin.y;
}

//width
-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(CGFloat)width{
    return self.frame.size.width;
}

//height
-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
-(CGFloat)height{
    return self.frame.size.height;
}

//centerX
-(void)setCenterX:(CGFloat)centerX{
    CGRect frame = self.frame;
    frame.origin.x = centerX - frame.size.width/2.0;
    self.frame = frame;
}
-(CGFloat)centerX{
    return CGRectGetMidX(self.frame);
}

//centerY
-(void)setCenterY:(CGFloat)centerY{
    CGRect frame = self.frame;
    frame.origin.y = centerY - frame.size.height/2.0;
    self.frame = frame;
}
-(CGFloat)centerY{
    return CGRectGetMidY(self.frame);
}

//size
-(void)setSize:(CGSize)size{
    CGRect frame=self.frame;
    frame.size=size;
    self.frame=frame;
}
-(CGSize)size{
    return self.frame.size;
}

@end
