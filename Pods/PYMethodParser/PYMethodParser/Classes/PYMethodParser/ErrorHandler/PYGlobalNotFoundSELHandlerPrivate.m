
//  PYGlobalMethodParseErrorHandler.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/22.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYGlobalNotFoundSELHandlerPrivate.h"
#import "PYGlobalNotFoundSELHandler.h"
//#import "PYMethodParserHeaders.h"
@implementation PYGlobalNotFoundSELHandlerPrivate
+ (void) methodParseErrorWithSel:(SEL) sel andClass: (Class) class and_va_list: (va_list) vaList {
    NSMethodSignature *signature;
    Class PYGlobalNotFoundSELHandlerType;
        // 没有值那么就发送一条固定消息到对象
    SEL remedySEL = NSSelectorFromString(@"py_notFoundSEL:and_va_list:");
    
        signature = [class methodSignatureForSelector: remedySEL];
        if (signature) {
            // 向对象 发送对象方法 '- (void)py_notFoundSEL:(SEL)sel and_va_list: (va_list)vaList' 发送补救信息，并把原来想发送的消息传递过去
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            [invocation setTarget:class];
            [invocation setSelector:remedySEL];
            [invocation setArgument:&sel atIndex:2];
            [invocation setArgument:&vaList atIndex:3];
            [invocation invoke];
            
        } else {
            // 向PYGlobalNotFoundSELHandler消息: + (void)py_notFoundSEL:(SEL)sel
            SEL globalNotFontSEL = NSSelectorFromString(@"py_globalNotFoundSEL:withClass:and_vaList:");
            if (!PYGlobalNotFoundSELHandlerType) {
                PYGlobalNotFoundSELHandlerType = [PYGlobalNotFoundSELHandler class];
            }
            if([PYGlobalNotFoundSELHandlerType respondsToSelector:globalNotFontSEL]) {

                NSMethodSignature *signature =
                [PYGlobalNotFoundSELHandlerType methodSignatureForSelector: globalNotFontSEL];
                NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
                [invocation setTarget:PYGlobalNotFoundSELHandlerType];
                [invocation setSelector:globalNotFontSEL];
                [invocation setArgument:&sel atIndex:2];
                [invocation setArgument:&class atIndex:3];
                [invocation setArgument:&vaList atIndex:4];
                [invocation invoke];
            }
        }
        return;
}
@end
