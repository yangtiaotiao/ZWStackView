//
//  ZWStackContentView.h
//  StackView
//
//  Created by Yang on 2018/8/24.
//  Copyright © 2018年 YZW. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZWStackCardView;
@interface ZWStackContentView : UIView


/**
 添加新的cardView

 @param cardView cardView
 */
- (void)addNewCardView:(ZWStackCardView *)cardView;

/**
 移除指定index的cardView

 @param index index
 */
- (void)removeCardViewFromIndex:(NSInteger)index;

@end
