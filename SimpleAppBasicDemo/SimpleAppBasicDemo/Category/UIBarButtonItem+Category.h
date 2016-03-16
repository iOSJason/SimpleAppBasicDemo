//
//  UIBarButtonItem+Category.h
//  SimpleAppBasicDemo
//
//  Created by 劉光軍 on 16/3/16.
//  Copyright © 2016年 劉光軍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Category)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)imageName highImage:(NSString *)highImageName;

@end
