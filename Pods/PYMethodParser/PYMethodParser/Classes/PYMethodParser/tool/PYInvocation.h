//
//  PYInvocation.h
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/21.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 内部封装了 一个NSInvocation
 */
@interface PYInvocation : NSObject

/**
 创建一个对象，根据传入的NSMethodSignature创建一个NSInvocation

 @param sig 方法签名
 @return 新的对象
 */
+ (PYInvocation *)invocationWithMethodSignature:(NSMethodSignature *)sig;

/**
 参数列表
 */
//@property (nonatomic,strong) NSArray *arguments;

/**
 添加void *(CF等底层api需要调用这个函数添加)对象参数

 @param cfpointer void *对象参数
 @param i 参数index（需要从第2 开始，因为函数内置两个参数： self 与 _cmd）
 */
- (void)setArgumentWith_CFPointer: (void*) cfpointer andIndex: (NSInteger) i;


@property (readonly, retain) NSMethodSignature *methodSignature;

- (void)retainArguments;
@property (readonly) BOOL argumentsRetained;

@property (nullable, assign) id target;
@property SEL selector;

- (void)getReturnValue:(void *)retLoc;
- (void)setReturnValue:(void *)retLoc;


- (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx;

/**
 添加oc对象参数
 
 @param argumentLocation obj oc对象参数
 @param idx 参数index（需要从第2 开始，因为函数内置两个参数： self 与 _cmd）
 */
- (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx;
/// 执行方法
- (void)invoke;
/// target 执行方法
- (void)invokeWithTarget:(id)target;
@end
