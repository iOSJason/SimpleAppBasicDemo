//
//  LGJTabBarController.m
//  SimpleAppBasicDemo
//
//  Created by 劉光軍 on 16/3/16.
//  Copyright © 2016年 劉光軍. All rights reserved.
//

#import "LGJTabBarController.h"
#import "UIView+Category.h"
#import "LGJTabBar.h"
#import "LGJNavigationController.h"
#import "MainViewController.h"
#import "ChoiceViewController.h"
#import "MineViewController.h"

@interface LGJTabBarController ()<UITabBarControllerDelegate>

@end

@implementation LGJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    [self addCustomTabBar];
    [self addAllChildViewController];
}

- (void)addCustomTabBar {
    
        //创建自定义tabbar
    LGJTabBar *customTabBar = [[LGJTabBar alloc] init];
        //更换系统自带的tabbar
    [self setValue:customTabBar forKeyPath:@"tabBar"];
}


/**
 *  添加所有的子控制器
 */
- (void)addAllChildViewController {
    
        //首页
    MainViewController *mainVC = [[MainViewController alloc] init];
    ChoiceViewController *choiceVC = [[ChoiceViewController alloc] init];
    MineViewController *mineVC = [[MineViewController alloc] init];
    
    [self addOneChildViewController:mainVC title:@"首页" imageName:@"tab_home_pre" selectedImageName:@"tab_home_pre"];
    [self addOneChildViewController:choiceVC title:@"精选" imageName:@"tab_jingxuan_nor" selectedImageName:@"tab_jingxuan_pre"];
    [self addOneChildViewController:mineVC title:@"我的" imageName:@"tab_wode_nor" selectedImageName:@"tab_wode_pre"];
}


/**
 *  添加单个子控制器
 *
 *  @param childViewController 要添加的子控制器
 *  @param title               控制器的title
 *  @param imageName           tabBar的图片
 *  @param selectedImageName   tabBar被选中时的图片
 */
- (void)addOneChildViewController:(UIViewController *)childViewController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    childViewController.title = title;
    childViewController.tabBarItem.image = [UIImage imageNamed:imageName];
    
        //设置tabbarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childViewController.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
        //设置tabbarItem被选中时的文字颜色
    NSMutableDictionary *selectdTextAttrs = [NSMutableDictionary dictionary];
    selectdTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:244/255.0 green:165/255.0 blue:27/255.0 alpha:1];
    selectdTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childViewController.tabBarItem setTitleTextAttributes:selectdTextAttrs forState:UIControlStateSelected];
    
        //设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
        //声明这张图用原图
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childViewController.tabBarItem.selectedImage = selectedImage;
    
        //添加为tabbar的子视图控制器
    LGJNavigationController *nav = [[LGJNavigationController alloc] initWithRootViewController:childViewController];
    [self addChildViewController:nav];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
