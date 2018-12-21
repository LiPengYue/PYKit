//
//  PYMethodParserConfig.m
//  Expecta
//
//  Created by 李鹏跃 on 2018/11/24.
//

#import "PYMethodParserConfig.h"
#import "PYMethodParserGlobleConfig.h"

@implementation PYMethodParserConfig
+ (void) setupConfig: (void(^)(PYMethodParserGlobleConfig *config)) block {
    if (block) {
        PYMethodParserGlobleConfig *config = [PYMethodParserGlobleConfig new];
        block(config);
    }
}


/**
 * 获取异常情况的处理 的类。
 */
+ (Class) get_globalNotFoundSELHandlerType {
   
    return [PYMethodParserGlobleConfig get_globalNotFoundSELHandlerType];
}

/**
 * 缓存NSMethodSigture最大存储量
 */
+ (long long) get_maxMethodSignatureCacheCount {
    return [PYMethodParserGlobleConfig get_maxMethodSignatureCacheCount];
}

/**
 * 缓存处理的delegate
 */
+ (id <NSCacheDelegate>) get_methodSignatureCacheDelegate {
    return [PYMethodParserGlobleConfig get_methodSignatureCacheDelegate];
}

/// debug 下是否需要打印方法 解析、调用 出错的log
+ (BOOL) get_isPrintfLogWithMethodParserError {
    return [PYMethodParserGlobleConfig get_isPrintfLogWithMethodParserError];
}
/// debug 下是否需要打印方法 解析、调用 成功的log
+ (BOOL) get_isPrintfLogWithMethodPraserCallMethodSuccess {
    return [PYMethodParserGlobleConfig get_isPrintfLogWithMethodPraserCallMethodSuccess];
}
/// 是否打印解析参数时候的log
+ (BOOL) get_isPrintf_methodParser_Boxing_Log {
    return [PYMethodParserGlobleConfig get_isPrintf_methodParser_Boxing_Log];
}
@end
