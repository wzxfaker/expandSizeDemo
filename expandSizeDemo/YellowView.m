//
//  YellowView.m
//  expandSizeDemo
//
//  Created by admin on 2018/3/12.
//  Copyright © 2018年 gcg. All rights reserved.
//

#import "YellowView.h"

@implementation YellowView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"🏀--%@",NSStringFromClass([self class]));
    return self;
}

@end
