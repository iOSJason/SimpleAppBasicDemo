//
//  MainViewController.m
//  SimpleAppBasicDemo
//
//  Created by 劉光軍 on 16/3/16.
//  Copyright © 2016年 劉光軍. All rights reserved.
//

#import "MainViewController.h"
#import "UIBarButtonItem+Category.h"
#import "NextViewController.h"

@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView* tableView;/**< tableView */
@property(nonatomic, strong) NSArray* dataArr;/**< array */

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    
    [self setNavComponent];
    [self buildTableView];
    
    // Do any additional setup after loading the view.
}

#pragma mark - 设置导航栏透明
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"toumingbeijing"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

#pragma mark - 导航栏
- (void)setNavComponent {
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(next) image:@"nav_scan_code" highImage:nil];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setTitle:@"Bang" forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    [leftBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}

- (void)click {
    NSLog(@"点击左按钮");
}

- (void)next {
    
    NextViewController *nextVC = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}


#pragma mark - TableView
- (void)buildTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
}

    //tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.contentView.backgroundColor = [UIColor grayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:22];
    cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [_dataArr objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 200;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    imageV.image = [UIImage imageNamed:@"tydhy.jpg"];
    return imageV;
}

#pragma mark - 设置滑动时导航栏透明度变化
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.tableView.contentOffset.y < 0.1) {
        NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
        textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [self.navigationItem.leftBarButtonItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
        
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"toumingbeijing"] forBarMetrics:UIBarMetricsDefault];
    } else {
        
        CGFloat alpha = self.tableView.contentOffset.y / 200.0f > 1.0f ? 1: self.tableView.contentOffset.y/200.0f;
        [self.navigationController.navigationBar setBackgroundImage:[self getImageWithAlpha:alpha] forBarMetrics:UIBarMetricsDefault];
        
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(next) image:@"scan_code_c" highImage:nil];
    }
}

    //根据滑动尺寸改变透明度
- (UIImage *)getImageWithAlpha:(CGFloat)alpha {
    
    UIColor *color = [UIColor colorWithRed:251/255.0 green:249/255.0 blue:248/255.0 alpha:alpha];
    CGSize colorSize = CGSizeMake(1, 1);
    
        //UIGraphicsBeginImageContext（）获取指定需要截取color的size
    UIGraphicsBeginImageContext(colorSize);
        //得到当前上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
        //用颜色填充
    CGContextSetFillColorWithColor(context, color.CGColor);
        //每个截取到的上下文中需要填充的模板的frame
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
