//
//  XItem.m
//  expandSizeDemo
//
//  Created by admin on 2018/3/12.
//  Copyright © 2018年 gcg. All rights reserved.
//

#import "XItem.h"
#import <objc/runtime.h>
#import "TestItem.h"

@implementation XItem

//@dynamic name;
//@dynamic sex;

//@synthesize name;
//@synthesize sex;

@synthesize name = _name;
@synthesize sex = _sex;

void dynamicAdditionMethod(id self,SEL _cmd,id *str){
    NSLog(@"添加了一段字符串--%@",str);
}

- (id)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
}

//1.询问是否可以动态添加方法
+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == @selector(goAndRun:)) {
//        class_addMethod(self, sel, (IMP)dynamicAdditionMethod, "v@:@");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}

//2.备用接收者,当对象所属类不能动态添加方法后，runtime就会询问当前的接受者是否有其他对象可以处理这个未知的selector
- (id)forwardingTargetForSelector:(SEL)aSelector{
    NSLog(@"%s",__func__);
//    return [[TestItem alloc] init];
    return nil;
}

//3.如果没有备用接受者，runtime会发送methodSignatureForSelector:消息查看selector对应的方法签名，即参数和返回值的类型信息。如果有方法签名，runtime则根据方法签名创建描述该消息的NSIvocation，向当前对象发送forwardInvocation:消息，以创建NSInvocation对象作为参数
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel isEqualToString:@"goAndRun"]) {
        NSString *string = @"v@:";
        const char *types = [string UTF8String];
        return [NSMethodSignature signatureWithObjCTypes:types];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    SEL aSelector = [anInvocation selector];
    TestItem *secondItem = [[TestItem alloc] init];
    if ([secondItem respondsToSelector:aSelector]) {
        [anInvocation invokeWithTarget:secondItem];
    }
}

//4.如果前边三个都不能处理，就会抛出doesnotRecognizeSelector异常，程序崩溃



- (void)testMethod{
    NSLog(@"本类中的test方法");
}




@end
