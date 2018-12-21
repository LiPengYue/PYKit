//
//  PYMethodParserGlobleConfig.m
//  Expecta
//
//  Created by 李鹏跃 on 2018/11/24.
//

#import "PYMethodParserGlobleConfig.h"


/**
 * 对PYInvocation调用函数后，出现的异常情况的处理。
 * @warning 为 PYGlobalNotFoundSELHandler 的子类
 * @warning 重写 方法 + (void) py_globalNotFoundSEL: (SEL) sel withClass: (Class) clas and_vaList: (va_list)list;
 * @warning 如果PYGlobalNotFoundSELHandler == nil,那么默认为PYGlobalNotFoundSELHandler类来处理
 * @warning PYGlobalNotFoundSELHandler 主要是Dbug环境下打印了调用函数的对象，还有SEL
 */
static Class PYGlobalNotFoundSELHandlerType;

/**
 * 缓存NSMethodSigture最大存储量 可以在AppDelegate中自定义
 * 存量超过后会调用 py_MethodSignatureCacheDelegate 方法
 */
static long long py_maxMethodSignatureCacheCount;

/**
 * 缓存处理的工具类
 
 在缓存的方法签名超过 py_maxCacheCount 的个数后，会触发这个方法
 */
static id <NSCacheDelegate> py_MethodSignatureCacheDelegate;

/// debug 下是否需要打印方法 解析、调用 出错的log
static BOOL py_isPrintfLogWithMethodParserError;
/// debug 下是否需要打印方法 解析、调用 成功的log
static BOOL py_isPrintfLogWithMethodPraserCallMethodSuccess;
/// 是否打印解析参数时候的log
static BOOL py_isPrintf_methodParser_Boxing_Log;

@implementation PYMethodParserGlobleConfig
/**
 * 对PYInvocation调用函数后，出现的异常情况的处理。
*/
- (PYMethodParserGlobleConfig* (^)(Class)) setup_globalNotFoundSELHandlerType {
    return ^(Class clas) {
        PYGlobalNotFoundSELHandlerType = clas;
        return self;
    };
}
/**
 * 缓存NSMethodSigture最大存储量 可以在AppDelegate中自定义
 * 存量超过后会调用 py_MethodSignatureCacheDelegate 方法
 */
- (PYMethodParserGlobleConfig* (^)(long long)) setup_methodSignatureMaxCount {
    return ^(long long count) {
        py_maxMethodSignatureCacheCount = count;
        return self;
    };
}

/**
 * 缓存处理的工具类
 
 在缓存的方法签名超过 py_maxCacheCount 的个数后，会触发这个代理方法
 */
- (PYMethodParserGlobleConfig* (^)(id<NSCacheDelegate> delegate)) setup_methodSignatureCacheDelegate {
    return ^(id <NSCacheDelegate>delegate) {
        py_MethodSignatureCacheDelegate = delegate;
        return self;
    };
}

/// debug 下是否需要打印方法 解析、调用 出错的log
- (PYMethodParserGlobleConfig* (^)(BOOL)) setup_isPrintfLogWithMethodParserError {
    return ^(BOOL isPrintf) {
        py_isPrintfLogWithMethodParserError = isPrintf;
        return self;
    };
}
/// debug 下是否需要打印方法 解析、调用 成功的log
- (PYMethodParserGlobleConfig* (^)(BOOL)) setup_isPrintfLogWithMethodPraserCallMethodSuccess {
    return ^(BOOL isPrintf) {
        py_isPrintfLogWithMethodPraserCallMethodSuccess = isPrintf;
        return self;
    };
}
/// 是否打印解析参数时候的log
- (PYMethodParserGlobleConfig* (^)(BOOL)) setup_isPrintf_methodParser_Boxing_Log {
    return ^(BOOL isPrintf) {
        py_isPrintf_methodParser_Boxing_Log = isPrintf;
        return self;
    };
}


/**
 * 获取异常情况的处理 的类。
 */
+ (Class) get_globalNotFoundSELHandlerType {
    return PYGlobalNotFoundSELHandlerType;
}

/**
 * 缓存NSMethodSigture最大存储量
 */
+ (long long) get_maxMethodSignatureCacheCount {
    return py_maxMethodSignatureCacheCount;
}

/**
 * 缓存处理的delegate
 */
+ (id <NSCacheDelegate>) get_methodSignatureCacheDelegate {
    return py_MethodSignatureCacheDelegate;
}

/// debug 下是否需要打印方法 解析、调用 出错的log
+ (BOOL) get_isPrintfLogWithMethodParserError {
    return py_isPrintfLogWithMethodParserError;
}
/// debug 下是否需要打印方法 解析、调用 成功的log
+ (BOOL) get_isPrintfLogWithMethodPraserCallMethodSuccess {
    return py_isPrintfLogWithMethodPraserCallMethodSuccess;
}
/// 是否打印解析参数时候的log
+ (BOOL) get_isPrintf_methodParser_Boxing_Log {
    return py_isPrintf_methodParser_Boxing_Log;
}
@end
