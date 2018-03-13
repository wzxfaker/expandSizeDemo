//
//  ViewController.m
//  expandSizeDemo
//
//  Created by admin on 2018/3/12.
//  Copyright © 2018年 gcg. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+expandSize.h"
#import "RedView.h"
#import "YellowView.h"
#import "GreenView.h"
#import "OrangeView.h"
#import "XItem.h"

@interface ViewController ()

/** <##> */
@property (nonatomic, strong) RedView *redView;
/** <##> */
@property (nonatomic, strong) YellowView *yellowView;
/** <##> */
@property (nonatomic, strong) GreenView *greenView;
/** <##> */
@property (nonatomic, strong) OrangeView *orangeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.center = self.view.center;
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"测试" forState:UIControlStateNormal];
//    [button expandSize:100];
    [self.view addSubview:button];
    
    RedView *redView = [[RedView alloc] initWithFrame:CGRectMake(10, 10, 200, 300)];
    self.redView = redView;
//    [self.view addSubview:redView];
    
    YellowView *yellowView = [[YellowView alloc] initWithFrame:CGRectMake(20, 80, 150, 100)];
    self.yellowView = yellowView;
//    [self.view addSubview:yellowView];
    
    GreenView *greenView = [[GreenView alloc] initWithFrame:CGRectMake(100, 300, 150, 300)];
    self.greenView = greenView;
//    [self.view addSubview:greenView];
    
    OrangeView *orangeView = [[OrangeView alloc] initWithFrame:CGRectMake(150, 200, 200, 100)];
    self.orangeView = orangeView;
//    [self.view addSubview:orangeView];
    
    XItem *item = [[XItem alloc] init];
    item.name = @"王泽信";
    item.sex = @"男";
    NSLog(@"个人信息--%@，%@",item.name,item.sex);
    
    //消息转发机制验证
    id secondItem = [[XItem alloc] init];
//    [secondItem appendString:@"哈哈"];
    [secondItem performSelector:@selector(goAndRun)];
}

- (void)btnClick{
    NSLog(@"点击了按钮");
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event{
//    CGPoint
//
//}



@end
