//
//  NSObject+PYNotFoundSELHandler.h
//  Expecta
//
//  Created by 李鹏跃 on 2018/11/24.
//

#import <Foundation/Foundation.h>

@interface NSObject (PYNotFoundSELHandler)

// MARK: 处理 函数未找到的情况
+ (void) py_notFoundSEL:(SEL)sel and_va_list: (va_list)list;
@end
