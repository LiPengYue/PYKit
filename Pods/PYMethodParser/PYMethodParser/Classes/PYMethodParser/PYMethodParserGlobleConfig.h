//
//  PYMethodParserGlobleConfig.h
//  Expecta
//
//  Created by 李鹏跃 on 2018/11/24.
//

#import <Foundation/Foundation.h>


/**
 相关配置
 */
@interface PYMethodParserGlobleConfig : NSObject

/**
 * 对PYInvocation调用函数后，出现的异常情况的处理。
 * @warning 为 PYGlobalNotFoundSELHandler 的子类
 * @warning 重写 方法 + (void) py_globalNotFoundSEL: (SEL) sel withClass: (Class) clas and_vaList: (va_list)list;
 * @warning 如果PYGlobalNotFoundSELHandler == nil,那么默认为PYGlobalNotFoundSELHandler类来处理
 * @warning PYGlobalNotFoundSELHandler 主要是Dbug环境下打印了调用函数的对象，还有SEL
 */
- (PYMethodParserGlobleConfig* (^)(Class)) setup_globalNotFoundSELHandlerType;
/**
* 缓存NSMethodSigture最大存储量 可以在AppDelegate中自定义
* 存量超过后会调用 py_MethodSignatureCacheDelegate 方法
*/
- (PYMethodParserGlobleConfig* (^)(long long)) setup_methodSignatureMaxCount;

/**
 * 缓存处理的工具类
 
 在缓存的方法签名超过 py_maxCacheCount 的个数后，会触发这个代理方法
 */
- (PYMethodParserGlobleConfig* (^)(id<NSCacheDelegate> delegate)) setup_methodSignatureCacheDelegate;

/// debug 下是否需要打印方法 解析、调用 出错的log
- (PYMethodParserGlobleConfig* (^)(BOOL)) setup_isPrintfLogWithMethodParserError;
/// debug 下是否需要打印方法 解析、调用 成功的log
- (PYMethodParserGlobleConfig* (^)(BOOL)) setup_isPrintfLogWithMethodPraserCallMethodSuccess;
/// 是否打印解析参数时候的log
- (PYMethodParserGlobleConfig* (^)(BOOL)) setup_isPrintf_methodParser_Boxing_Log;


/**
 * 获取异常情况的处理 的类。
 */
+ (Class) get_globalNotFoundSELHandlerType;

/**
 * 缓存NSMethodSigture最大存储量
 */
+ (long long) get_maxMethodSignatureCacheCount;

/**
 * 缓存处理的delegate
 */
+ (id <NSCacheDelegate>) get_methodSignatureCacheDelegate;

/// debug 下是否需要打印方法 解析、调用 出错的log
+ (BOOL) get_isPrintfLogWithMethodParserError;
/// debug 下是否需要打印方法 解析、调用 成功的log
+ (BOOL) get_isPrintfLogWithMethodPraserCallMethodSuccess;
/// 是否打印解析参数时候的log
+ (BOOL) get_isPrintf_methodParser_Boxing_Log;
@end


