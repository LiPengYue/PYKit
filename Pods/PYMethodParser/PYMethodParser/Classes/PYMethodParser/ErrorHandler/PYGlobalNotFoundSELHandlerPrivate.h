//
//  PYGlobalMethodParseErrorHandler.h
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/22.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PYGlobalNotFoundSELHandlerPrivate : NSObject
+ (void) methodParseErrorWithSel:(SEL) sel andClass: (Class) class and_va_list: (va_list) vaList;
@end
