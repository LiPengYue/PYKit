//
//  Header.h
//  PYKit
//
//  Created by 李鹏跃 on 2018/11/22.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//
#import <Foundation/Foundation.h>
#ifndef Header_h
#define Header_h


/// 关于方法动态调用工具
#import "PYMethodParser.h"
/// 对PYInvocation 函数调用异常的全局处理
#import "PYGlobalNotFoundSELHandler.h"
/// 方法调用的实体类
#import "PYInvocation.h"


/**
 * 对PYInvocation调用函数后，出现的异常情况的处理。
 * @warning 为 PYGlobalNotFoundSELHandler 的子类
 * @warning 重写 方法 + (void) py_globalNotFoundSEL: (SEL) sel withClass: (Class) clas and_vaList: (va_list)list;
 * @warning 如果PYGlobalNotFoundSELHandler == nil,那么默认为PYGlobalNotFoundSELHandler类来处理
 * @warning PYGlobalNotFoundSELHandler 主要是Dbug环境下打印了调用函数的对象，还有SEL
 */
Class PYGlobalNotFoundSELHandlerType;

/**
 * 缓存NSMethodSigture最大存储量 可以在AppDelegate中自定义
 * 存量超过后会调用 py_MethodSignatureCacheDelegate 方法
 */
long long py_maxMethodSignatureCacheCount;

/**
 * 缓存处理的工具类
 
 在缓存的方法签名超过 py_maxCacheCount 的个数后，会触发这个方法
 */
id <NSCacheDelegate> py_MethodSignatureCacheDelegate;

typedef enum : NSUInteger {
    /// 类型转化失败
    PYMethodParserErrorEnum_TypeConversionError = 2001,
    /// 方法转化失败
    PYMethodParserErrorEnum_SELConversionError,
} PYMethodParserErrorEnum;

/// debug 下是否需要打印方法 解析、调用 出错的log
BOOL py_isPrintfLogWithMethodParserError;
/// debug 下是否需要打印方法 解析、调用 成功的log
BOOL py_isPrintfLogWithMethodPraserCallMethodSuccess;
/// 是否打印解析参数时候的log
BOOL py_isPrintf_methodParser_Boxing_Log;
#endif /* Header_h */


