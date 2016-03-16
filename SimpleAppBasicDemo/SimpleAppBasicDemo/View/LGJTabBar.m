//
//  LGJTabBar.m
//  SimpleAppBasicDemo
//
//  Created by 劉光軍 on 16/3/16.
//  Copyright © 2016年 劉光軍. All rights reserved.
//

#import "LGJTabBar.h"
#import "UIView+Category.h"

@implementation LGJTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
    backView.backgroundColor = [UIColor whiteColor];
    [self insertSubview:backView atIndex:0];
    self.opaque = YES;
    
    return  self;
}

    //布局子控件
- (void)layoutSubviews {
    
    [self setUpAllChildTabBarButtonFrame];
}

/**
 *  设置全部的tabbarButton的frame
 */
- (void)setUpAllChildTabBarButtonFrame {
    
    int index = 0;
    
    for (UIView *tabBarButton in self.subviews) {
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            continue;
        }
        [self setUpTabBarButtonFrame:tabBarButton atIndex:index];
        index++;
    }
}


/**
 *  设置每个tabBarButton的frame
 *
 *  @param tabBarButton 需要设置的tabbarButton
 *  @param index        tabbarButton所在的索引值
 */
- (void)setUpTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index {
    
    CGFloat buttonW = self.width / self.items.count;
    CGFloat buttonH = self.height;
    
    tabBarButton.width = buttonW;
    tabBarButton.height = buttonH;
    tabBarButton.x = buttonW*index;
    tabBarButton.y = 0;
    
}


@end
