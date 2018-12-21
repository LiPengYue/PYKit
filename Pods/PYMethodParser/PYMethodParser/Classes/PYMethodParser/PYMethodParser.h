//
//  PYMethodParser.h
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/20.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PYInvocation;


/**
 * @brief 关于方法动态调用工具
 * 如果调用失败，那么会进行消息转发，逻辑如下：

 * @warning
 检查调用类（对象）是否实现了类‘+ (void) py_notFoundSEL:(SEL)sel and_va_list: (va_list)list ’方法 如果实现了，那么执行类方法

 如果没有实现上述类方法，那么将调用 PYGlobalNotFoundSELHandlerType 指向的类对象的类方法：+ (void) py_globalNotFoundSEL: (SEL) sel withClass: (Class) clas and_vaList: (va_list)list

 * @bug
 1. 传入的sel参数个数与传入的参数列表个数不同

 2. 参数列表与方法参数列表类型必须一一对应，否则崩溃

 3. 传入的参数可以用nil表示

 4. 不能传递char类型参数，但是可以用int表示char
 */
@interface PYMethodParser : NSObject

/**
 解析一个对象方法

 @param target 对象
 @param error 异常
 @return 解析的数据，内部封装了NSInvocation
 @bug 如果传入的sel参数个数与传入的参数列表个数不同，则会崩溃
 @bug 如果对应的参数为空，那么用nil表示
 */
+ (PYInvocation *) parseMethodWithTarget:(id)target andSelName: (NSString *)selName  andError: (NSError *__autoreleasing*)error,...;

/**
 解析一个类方法

 @param className 类对象名字
 @param error error 异常
 @return 解析的数据，内部封装了NSInvocation
 @bug 如果传入的sel参数个数与传入的参数列表个数不同，则会崩溃
 @bug 如果对应的参数为空，那么用nil表示
 */
+ (PYInvocation *) parseMethodWithClassName: (NSString *)className andSelName: (NSString *)selName andError: (NSError *__autoreleasing*)error,...;

/**
 调用一个对象方法

 * @param target 对象
 * @param error 异常
 * @return 解析的数据，内部封装了NSInvocation
 */
+ (PYInvocation *) callMethodWithTarget:(id)target andSelName: (NSString *)selName  andError: (NSError *__autoreleasing*)error,...;

/**
 调用一个类方法

 @param className 类对象名字
 @param error error 异常
 @return 解析的数据，内部封装了NSInvocation
 @bug 如果传入的sel参数个数与传入的参数列表个数不同，则会崩溃
 @bug 传入的参数列表类型必须与方法参数列表类型一一对应，（因为内部的va_list 获取数据是根据指针指向的参数地址➕偏移参数类型大小 来获取参数值的，获取完成后会自动把指针指向下一个参数内存空间起始位）
 @bug 如果对应的参数为空，那么用nil表示
 */
+ (PYInvocation *) callMethodWithClassName: (NSString *)className andSelName: (NSString *)selName  andError: (NSError *__autoreleasing*)error,...;
@end
