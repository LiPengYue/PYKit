//
//  PYGlobalNotFoundSELHandler.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/22.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYGlobalNotFoundSELHandler.h"
#import "PYMethodParserConfig.h"

#ifdef DEBUG
# define py_DLog(...) NSLog(__VA_ARGS__);
#else
# define py_DLog(...);
#endif

@implementation PYGlobalNotFoundSELHandler
+ (void) py_globalNotFoundSEL: (SEL) sel withClass: (Class) clas and_vaList: (va_list)list {
    NSString *classString = NSStringFromClass(clas);
    NSString *selString = NSStringFromSelector(sel);
    Class PYGlobalNotFoundSELHandlerType;
    Class handlerClass =
    [PYGlobalNotFoundSELHandlerType class]
    ? [PYGlobalNotFoundSELHandlerType class]
    : [PYGlobalNotFoundSELHandler class];
    
    NSString *handlerClassName = NSStringFromClass(handlerClass);
    NSString *description =
    [NSString stringWithFormat:
     @"\
     \n    🌶🌶🌶\
     \n    方法调用出错，已经开始进行默认处理\
     \n    具体请看【%@】\
     \n    方法：【+ py_globalNotFoundSEL:】\
     \n    调用方法类：《%@》\
     \n    方法为：《%@》\
     \n    🌶🌶🌶\n ",
     handlerClassName,
     classString,
     selString
     ];
    if ([PYMethodParserConfig get_isPrintfLogWithMethodParserError]) {
        py_DLog(@"%@",description);
    }
}
@end
