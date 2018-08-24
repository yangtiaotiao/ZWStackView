//
//  ZWStackCardView.h
//  StackView
//
//  Created by Yang on 2018/8/24.
//  Copyright © 2018年 YZW. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZWStackCardViewDelegate <NSObject>
- (void)cardViewBecomeUppermostWith:(NSInteger )index;

@end


@interface ZWStackCardView : UIView

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, weak) id<ZWStackCardViewDelegate> delegate;

@end
