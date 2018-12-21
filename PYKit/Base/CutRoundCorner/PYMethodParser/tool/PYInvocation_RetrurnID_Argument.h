//
//  PYInvocation_RetrurnID_Argument.h
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/21.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 包装oc桥接的cf参数
 * invocation在 - (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx; 方法中需要OC桥接为CF
 * 这个类主要是起到了持有参数，延迟销毁c参数的作用
 */
@interface PYInvocation_RetrurnID_Argument : NSObject
@property (nonatomic,assign) void *objArgument;
@end
