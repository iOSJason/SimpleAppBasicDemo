//
//  LGJNavigarionController.m
//  SimpleAppBasicDemo
//
//  Created by 劉光軍 on 16/3/16.
//  Copyright © 2016年 劉光軍. All rights reserved.
//

#import "LGJNavigationController.h"
#import "UIBarButtonItem+Category.h"

@interface LGJNavigationController ()

@end

@implementation LGJNavigationController

/**
 *  只初始化一次
 */
+ (void)initialize {
    
        //设置项目中的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
        //Normal
    NSMutableDictionary *textAtts = [NSMutableDictionary dictionary];
    textAtts[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAtts[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:textAtts forState:UIControlStateNormal];
    
        //不可用状态
    NSMutableDictionary *disableTextAtts = [NSMutableDictionary dictionary];
    disableTextAtts[NSForegroundColorAttributeName] = [UIColor colorWithRed:123/255.0 green:123/255.0 blue:123/255.0 alpha:1];
    disableTextAtts[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:disableTextAtts forState:UIControlStateDisabled];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 
 *
 *  @param viewController 即将push进来的控制器
 *  @param animated       动画
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
            //此时push进来的viewController是第二个子控制器
            //自动隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
            //定义lefeBarButtonItem
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back ) image:@"nav_back" highImage:@"nav_back"];
    }
        //调用父类pushViewController,self.viewControllers数组添加对象viewController
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
