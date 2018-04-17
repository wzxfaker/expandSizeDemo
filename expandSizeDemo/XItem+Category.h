//
//  XItem+Category.h
//  expandSizeDemo
//
//  Created by admin on 2018/4/3.
//  Copyright © 2018年 gcg. All rights reserved.
//

#import "XItem.h"

@interface XItem (Category)

/** 分类中如果声明了一个和本类中同名的方法，调用时会执行分类中的方法结果，因为分类中添加的方法是把该方法合并到本类中methodList中的 */
- (void)testMethod;

@end
