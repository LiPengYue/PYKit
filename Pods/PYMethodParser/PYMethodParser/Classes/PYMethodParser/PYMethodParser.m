//
//  PYMethodParser.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/20.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYMethodParser.h"
#import "PYMethodParserConfig.h"
#import "PYMethodSignatureCache.h"
#import "PYInvocation.h"
#import "PYGlobalNotFoundSELHandlerPrivate.h"
#include "strings.h"
#define py_methodParser_Boxing_Log(...) \
BOOL py_isPrintf_methodParser_Boxing_Log = [PYMethodParserConfig get_isPrintf_methodParser_Boxing_Log];\
    if(py_isPrintf_methodParser_Boxing_Log) {\
    py_DLog(__VA_ARGS__);\
    }

#ifdef DEBUG
# define py_DLog(...) NSLog(__VA_ARGS__);
#else
# define py_DLog(...);
#endif


/**
 * 缓存的方法签名
 * 结构为 {class:{class:methodSignature}}
*/
static PYMethodSignatureCache const *py_methodSignatureCache;


/**
 获取方法签名并缓存

 @param class 类名
 @param sel 方法
 @return 方法签名
 */
static inline NSMethodSignature * py_getMethodSignature(NSString *class, SEL sel) {
    NSMethodSignature *signature = nil;
    
    
    long long py_maxMethodSignatureCacheCount = [PYMethodParserConfig get_maxMethodSignatureCacheCount];
    Class PYGlobalNotFoundSELHandlerType = [PYMethodParserConfig get_globalNotFoundSELHandlerType];
    
    if (!py_methodSignatureCache) {
        py_methodSignatureCache = [[PYMethodSignatureCache alloc]init];
    }
    PYMethodSignatureCache * methodSignatureCache = [py_methodSignatureCache objectForKey:class];
    NSString *selName = NSStringFromSelector(sel);
    if (!methodSignatureCache) {
        methodSignatureCache = [[PYMethodSignatureCache alloc]init];
//        methodSignatureCache.delegate = py_MethodSignatureCacheDelegate;
        Class c = NSClassFromString(class);

        signature = [c  instanceMethodSignatureForSelector: sel];
        if (!signature) {
            signature = [c  methodSignatureForSelector:sel];
        }
        
        if (!signature) return nil;
        
        [methodSignatureCache setObject:signature forKey:class cost:py_maxMethodSignatureCacheCount];
        
        [py_methodSignatureCache setObject:methodSignatureCache forKey:selName cost:py_maxMethodSignatureCacheCount];
    }
    if (!signature) {
        signature = [methodSignatureCache objectForKey:selName];
    }
    return signature;
}

// MAKR: - py_methodParser_Boxing 函数解析参数

/**
 解析一个多参数函数的参数值并用按顺序用数组返回

 @param vaList 多参数列表
 @param target 函数归属的类名
 @param selName 函数名
 @param error 错误
 @return 参数值列表
 */
static inline PYInvocation * py_methodParser_Boxing(va_list vaList, id target, NSString *selName, NSError **error);


static inline PYInvocation * py_methodParser_Boxing(va_list vaList, id target, NSString *selName, NSError **error) {
    
    SEL sel = NSSelectorFromString(selName);
    Class class = [target class];
    NSString *classStr = NSStringFromClass(class);
//    NSMutableArray *array = [NSMutableArray new];
    
    // 创建 并缓存 methodSignature
    NSMethodSignature *methodSignature = py_getMethodSignature(classStr, sel);
    
    if (!methodSignature) {
        py_DLog(@"\n\
                \n    🌶 方法签名获取失败\
                \n ");
        return nil;
    }
    
    // 创建 invocation
    PYInvocation *invocation = [PYInvocation invocationWithMethodSignature:methodSignature];
    [invocation setTarget: target];
    [invocation setSelector:sel];
    
    
    NSInteger maxCount = [methodSignature numberOfArguments];
    
    // 默认第0个参数为 'self'，第1个参数为 '_cmd'，自定义参数从第2个参数开始
    for (int i = 2; i < maxCount; i++) {
        const char *argumentType = [methodSignature getArgumentTypeAtIndex:i];
        NSObject *obj = nil;
        //@encode 表示把数据类型转化成类型标识
        //strcmp 比较两个char*A 与 char*B，
        //if(A==B) return 0;
        //if(A>B) return 大于0的int值;
        //if(A<B) return 小于0的int值;
        
        // id @
        if (!
            strcmp(argumentType, @encode(id))) {
            obj = va_arg(vaList, id);
            [invocation setArgument:&obj atIndex:i];
            py_methodParser_Boxing_Log(@"@encode(id) -> %s",argumentType);
        }
        // 基本数据类型
        else if (!strcmp(argumentType, @encode(int))) {
            int value = va_arg(vaList, int);
            [invocation setArgument:&value atIndex:i];
            obj = [[NSNumber alloc] initWithInt: value];
             py_methodParser_Boxing_Log(@"@encode(int) -> %s",argumentType);
        }
        else if (!strcmp(argumentType, @encode(unsigned int))) {
            unsigned int value = va_arg(vaList, unsigned int);
            [invocation setArgument:&value atIndex:i];
            obj = [[NSNumber alloc] initWithInt: value];
             py_methodParser_Boxing_Log(@"@encode(unsigned int) -> %s",argumentType);
        }
        else if (!strcmp(argumentType, @encode(long))) {
            long value = va_arg(vaList, long);
            [invocation setArgument:&value atIndex:i];
            obj = [[NSNumber alloc] initWithLong: value];
             py_methodParser_Boxing_Log(@"@encode(long) -> %s",argumentType);
        }
        else if (!strcmp(argumentType, @encode(unsigned long))) {
            unsigned long value = va_arg(vaList, unsigned long);
            [invocation setArgument:&value atIndex:i];
            obj = [[NSNumber alloc] initWithUnsignedLong: value];
             py_methodParser_Boxing_Log(@"@encode(unsigned long) -> %s",argumentType);
        }
        else if (!strcmp(argumentType, @encode(long long))) {
            long long value = va_arg(vaList, long long);
            [invocation setArgument:&value atIndex:i];
            obj = [[NSNumber alloc] initWithLongLong: value];
             py_methodParser_Boxing_Log(@"@encode(long long) -> %s",argumentType);
        }
        else if (!strcmp(argumentType, @encode(unsigned long long))) {
            unsigned long long value = va_arg(vaList, unsigned long long);
            [invocation setArgument:&value atIndex:i];
            obj = [[NSNumber alloc] initWithUnsignedLongLong: value];
             py_methodParser_Boxing_Log(@"@encode(unsigned long long) -> %s",argumentType);
        }
        else if (!strcmp(argumentType, @encode(double))) {
            double value = va_arg(vaList, double);
            [invocation setArgument:&value atIndex:i];
            obj = [[NSNumber alloc] initWithDouble: value];
             py_methodParser_Boxing_Log(@"@encode(double) -> %s",argumentType);
        }

        // 结构体
        else if (!strcmp(argumentType, @encode(CGRect))) {
            CGRect value = va_arg(vaList, CGRect);
            [invocation setArgument:&value atIndex:i];
            obj = [NSValue valueWithCGRect:value];
             py_methodParser_Boxing_Log(@"@encode(CGRect) -> %s",argumentType);
        }
        else if (!strcmp(argumentType, @encode(CGPoint))) {
            CGPoint value = va_arg(vaList, CGPoint);
            [invocation setArgument:&value atIndex:i];
            obj = [NSValue valueWithCGPoint:value];
             py_methodParser_Boxing_Log(@"@encode(CGPoint) -> %s",argumentType);
        }
        else if (!strcmp(argumentType, @encode(CGSize))) {
            CGSize value = va_arg(vaList, CGSize);
            [invocation setArgument:&value atIndex:i];
            obj = [NSValue valueWithCGSize:value];
             py_methodParser_Boxing_Log(@"@encode(CGSize) -> %s",argumentType);
        }
        else if (!strcmp(argumentType, @encode(NSRange))) {
            NSRange value = va_arg(vaList, NSRange);
            [invocation setArgument:&value atIndex:i];
            obj = [NSValue valueWithRange:value];
             py_methodParser_Boxing_Log(@"@encode(NSRange) -> %s",argumentType);
        }

        else if (!strcmp(argumentType, @encode(CGAffineTransform))) {
            CGAffineTransform value = va_arg(vaList, CGAffineTransform);
            [invocation setArgument:&value atIndex:i];
            obj = [NSValue valueWithCGAffineTransform:value];
             py_methodParser_Boxing_Log(@"@encode(CGAffineTransform) -> %s",argumentType);
        }
        else if (!strcmp(argumentType, @encode(UIEdgeInsets))) {
            UIEdgeInsets value = va_arg(vaList, UIEdgeInsets);
            [invocation setArgument:&value atIndex:i];
            obj = [NSValue valueWithUIEdgeInsets:value];
             py_methodParser_Boxing_Log(@"@encode(UIEdgeInsets) -> %s",argumentType);
        }
       
        else if (!strcmp(argumentType, @encode(UIOffset))) {
            UIOffset value = va_arg(vaList, UIOffset);
            [invocation setArgument:&value atIndex:i];
            obj = [NSValue valueWithUIOffset:value];
             py_methodParser_Boxing_Log(@"@encode(UIOffset) -> %s",argumentType);
        }
        else if (!strcmp(argumentType, @encode(CGVector))) {
            CGVector value = va_arg(vaList, CGVector);
            [invocation setArgument:&value atIndex:i];
            obj = [NSValue valueWithCGVector:value];
             py_methodParser_Boxing_Log(@"@encode(CGVector) -> %s",argumentType);
        }
        // class
        else if (!strcmp(argumentType, @encode(Class))) {
            Class value = va_arg(vaList, Class);
            [invocation setArgument:&value atIndex:i];
            obj = NSStringFromClass(value);
             py_methodParser_Boxing_Log(@"@encode(Class) -> %s",argumentType);
        }
        // sel
        else if (!strcmp(argumentType, @encode(SEL))) {
            SEL value = va_arg(vaList, SEL);
            [invocation setArgument:&value atIndex:i];
            obj = NSStringFromSelector(value);
             py_methodParser_Boxing_Log(@"@encode(SEL) -> %s",argumentType);
        }
        
        else if (!strcmp(argumentType, @encode(void(^)(void)))) {
            // block类型站八个字节，用void*来代替就可以
            void *value = va_arg(vaList, void*);
            py_methodParser_Boxing_Log(@"@encode(void(^)()) -> %s",argumentType);
            [invocation setArgumentWith_CFPointer:value andIndex:i];
        }
        
        // 一些 CG开头的或者CA开头的,还有类等结构体 主要是 '{'、 '[' 、 'double a[]数组'等
        else {
            
            char type = argumentType[0] == 'r' ? argumentType[1] : argumentType[0];
            if (type == '^') {
                void *value = va_arg(vaList, void**);
                 py_methodParser_Boxing_Log(@"@encode(void*) -> %s",argumentType);
                
                [invocation setArgumentWith_CFPointer: value andIndex:i];
            }
            
            else{
                if (@available(iOS 11.0, *)) {
                    if (!strcmp(argumentType, @encode(NSDirectionalEdgeInsets))) {
                        NSDirectionalEdgeInsets value = va_arg(vaList, NSDirectionalEdgeInsets);
                        [invocation setArgument:&value atIndex:i];
                        
                        obj = [NSValue valueWithDirectionalEdgeInsets:value];
                        py_methodParser_Boxing_Log(@"@encode(NSDirectionalEdgeInsets) -> %s",argumentType);
                    }else {
                        py_methodParser_Boxing_Log(@"@encode(NSDirectionalEdgeInsets) -> %s 但不是ios11",argumentType);
                        invocation = nil;
                        break;
                    }
                }else{
                    NSString *str = @"";
                    py_methodParser_Boxing_Log(@" \n\n\
                            未知的参数类型：【argumentType】为\
                            %@",str);
                    invocation = nil;
                    break;
                }
            }
        }
        
//        if (!obj) {
//            obj = [NSNull new];
//        }
//        [array addObject:obj];
    }
    return invocation;
}



// MAKR: - @implementation
@implementation PYMethodParser
+ (PYInvocation *) parseMethodWithTarget:(id)target andSelName: (NSString *)selName andError: (NSError *__autoreleasing*)error,... {
    va_list argList;
    va_start(argList, error);
    PYInvocation *invocation = py_methodParser_Boxing(argList, target, selName, error);
    [self py_getPYInvocation:invocation andTarget:target andError:error andSel:selName andVa_list:argList];
    va_end(argList);
    return invocation;
}
+ (PYInvocation *) parseMethodWithClassName: (NSString *)className andSelName: (NSString *)selName andError: (NSError *__autoreleasing*)error,... {
    id target = [self py_conversionTarget:className andError: error];
    if (!target) {
        return nil;
    }
    
    va_list argList;
    va_start(argList, error);
    PYInvocation *invocation = py_methodParser_Boxing(argList, target, selName, error);
    invocation = [self py_getPYInvocation:invocation andTarget:target andError:error andSel:selName andVa_list:argList];
    va_end(argList);
    return invocation;
}
+ (PYInvocation *) callMethodWithTarget:(id)target  andSelName: (NSString *)selName andError: (NSError *__autoreleasing*)error,... {
    
    va_list argList;
    va_start(argList, error);
    PYInvocation *invocation = py_methodParser_Boxing(argList, target, selName, error);
    invocation = [self py_getPYInvocation:invocation andTarget:target andError:error andSel:selName andVa_list:argList];
    va_end(argList);
    [invocation invoke];
    return invocation;
}
+ (PYInvocation *) callMethodWithClassName: (NSString *)className andSelName: (NSString *)selName  andError: (NSError *__autoreleasing*)error,... {
    id target = [self py_conversionTarget:className andError: error];
    if (!target) {
        return nil;
    }
    va_list argList;
    va_start(argList, error);
    PYInvocation *invocation = py_methodParser_Boxing(argList, NSClassFromString(className), selName, error);
    invocation = [self py_getPYInvocation:invocation andTarget:target andError:error andSel:selName andVa_list:argList];
    va_end(argList);
    [invocation invoke];
    return invocation;
}

+ (id) py_getPYInvocation: (PYInvocation *)invocation andTarget: (id)target andError:(NSError *__autoreleasing*)error andSel: (NSString *)sel andVa_list:(va_list) va_list{
    BOOL py_isPrintfLogWithMethodParserError = [PYMethodParserConfig get_isPrintfLogWithMethodParserError];
    if (!invocation) {
        NSString *errorDescription =
        [NSString stringWithFormat:
         @"\n\
         \n    🌶🌶🌶🌶\
         \n    ERROR: 方法调用失败：\
         \n    无法生成PYInvocation：\
         \n    对象：【%@】\
         \n    方法：%@\
         \n    🌶🌶🌶🌶\n ",target,sel];
        if (error) {
            *error = [NSError errorWithDomain:errorDescription code:PYMethodParserErrorEnum_TypeConversionError userInfo:nil];
        }
         if(py_isPrintfLogWithMethodParserError) {
            py_DLog(@"%@",errorDescription);
        }
        [PYGlobalNotFoundSELHandlerPrivate methodParseErrorWithSel:NSSelectorFromString(sel) andClass:[target class] and_va_list:va_list];
        
    }
    return invocation;
}

+ (id)py_conversionTarget: (NSString *)className andError: (NSError *__autoreleasing*) error {
    
    id target = NSClassFromString(className);
    BOOL py_isPrintfLogWithMethodParserError = [PYMethodParserConfig get_isPrintfLogWithMethodParserError];
    
    if (!target) {
        
        NSString *errorDescription =
        [NSString stringWithFormat:
         @"\n\
         \n    🌶🌶🌶🌶\
         \n   《%@》转化class错误\
         \n    🌶🌶🌶🌶 \n ",className];
        *error = [NSError errorWithDomain:errorDescription code:PYMethodParserErrorEnum_TypeConversionError userInfo:nil];
        if (py_isPrintfLogWithMethodParserError) {
            py_DLog(@"%@",errorDescription);
        }
        return nil;
    }
    return target;
}
@end

