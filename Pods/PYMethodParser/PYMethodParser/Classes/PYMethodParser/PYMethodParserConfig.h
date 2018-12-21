//
//  PYMethodParserConfig.h
//  Expecta
//
//  Created by 李鹏跃 on 2018/11/24.
//

#import <Foundation/Foundation.h>



typedef enum : NSUInteger {
    /// 类型转化失败
    PYMethodParserErrorEnum_TypeConversionError = 2001,
    /// 方法转化失败
    PYMethodParserErrorEnum_SELConversionError,
} PYMethodParserErrorEnum;

@class PYMethodParserGlobleConfig;
@interface PYMethodParserConfig : NSObject
+ (void) setupConfig: (void(^)(PYMethodParserGlobleConfig *config)) block;

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
