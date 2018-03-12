//
//  XItem.m
//  expandSizeDemo
//
//  Created by admin on 2018/3/12.
//  Copyright © 2018年 gcg. All rights reserved.
//

#import "XItem.h"

@implementation XItem

//@dynamic name;
//@dynamic sex;

//@synthesize name;
//@synthesize sex;

@synthesize name = _name;
@synthesize sex = _sex;

- (id)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    

}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    

}

@end
