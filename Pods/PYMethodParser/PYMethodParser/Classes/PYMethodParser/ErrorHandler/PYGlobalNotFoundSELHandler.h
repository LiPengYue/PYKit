//
//  PYGlobalNotFoundSELHandler.h
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/22.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import <Foundation/Foundation.h>



/**
 * 对PYInvocation 函数调用异常的全局处理 主要是Dbug环境下打印了调用函数的对象，还有SEL
 * @warning 需要在appDelegate 的didFinish 方法中对‘PYGlobalNotFoundSELHandlerType’赋值
 * @warning PYGlobalNotFoundSELHandlerType 需要为继承自PYGlobalNotFoundSELHandler的子类对象
 * @warning 覆盖 PYGlobalNotFoundSELHandler 的 【+ (void) py_globalNotFoundSEL: (SEL) sel withClass: (Class) clas and_vaList: (va_list)list;】来处理未知方法
 */
@interface PYGlobalNotFoundSELHandler : NSObject

+ (void) py_globalNotFoundSEL: (SEL) sel withClass: (Class) clas and_vaList: (va_list)list;
@end
