//
//  UIButton+expandSize.m
//  ExpandSizeDemo
//
//  Created by admin on 2018/3/12.
//  Copyright © 2018年 gcg. All rights reserved.
//

#import "UIButton+expandSize.h"

static char *expandSizeKey;

@implementation UIButton (expandSize)

- (void)expandSize:(CGFloat)size{
    objc_setAssociatedObject(self, &expandSizeKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//响应用户的点击事件
- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event{
    //扩大button的点击作用域
//    CGRect buttonRect = [self expandSize];
//    if (CGRectEqualToRect(buttonRect, self.bounds)) {
//        return [super pointInside:point withEvent:event];
//    }
//    return CGRectContainsPoint(buttonRect, point);
    
    //控制中间圆形区域点击有效
    CGPoint center = CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5);
    CGFloat offsetX = point.x-center.x;
    CGFloat offsetY = point.y-center.y;
    CGFloat radius = sqrt(offsetX*offsetX+offsetY*offsetY);
    return radius < self.bounds.size.width*0.5;
}

- (CGRect)expandSize{
    NSNumber *expandSize = objc_getAssociatedObject(self, &expandSizeKey);
    if (expandSize) {
        return CGRectMake(self.bounds.origin.x-expandSize.floatValue, self.bounds.origin.y-expandSize.floatValue, self.bounds.size.width+expandSize.floatValue*2, self.bounds.size.height+expandSize.floatValue*2);
    }else{
        return self.bounds;
    }
    return CGRectZero;
}

@end
