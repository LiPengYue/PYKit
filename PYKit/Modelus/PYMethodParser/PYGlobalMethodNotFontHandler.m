//
//  PYGlobalMethodNotFontHandler.m
//  PYMethodParser_Example
//
//  Created by 李鹏跃 on 2018/11/24.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYGlobalMethodNotFontHandler.h"

@implementation PYGlobalMethodNotFontHandler
+ (void) py_globalNotFoundSEL: (SEL) sel withClass: (Class) clas and_vaList: (va_list)list {

    NSLog(@"    【✅%@ 已经处理了未识别方法】",NSStringFromClass([self class]));
}
@end
