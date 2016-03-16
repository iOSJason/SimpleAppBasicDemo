//
//  UIBarButtonItem+Category.m
//  SimpleAppBasicDemo
//
//  Created by 劉光軍 on 16/3/16.
//  Copyright © 2016年 劉光軍. All rights reserved.
//

#import "UIBarButtonItem+Category.h"
#import "UIView+Category.h"

@implementation UIBarButtonItem (Category)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)imageName highImage:(NSString *)highImageName {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    btn.size = btn.currentBackgroundImage.size;
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
