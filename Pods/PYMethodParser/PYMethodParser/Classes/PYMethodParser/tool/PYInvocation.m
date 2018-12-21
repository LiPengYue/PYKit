//
//  PYInvocation.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/21.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYInvocation.h"
#import "PYInvocation_RetrurnID_Argument.h"
#import "PYMethodParserHeaders.h"
#import "PYMethodParserConfig.h"

#ifdef DEBUG
# define py_DLog(...) NSLog(__VA_ARGS__);
#else
# define py_DLog(...);
#endif

@interface PYInvocation ()
@property (nonatomic,strong) NSInvocation *invocation;
@property (nonatomic,strong) NSMutableDictionary <NSString *,PYInvocation_RetrurnID_Argument*> *py_array;
@property (nonatomic,strong) NSLock *py_ArrayLock;

@property (nonatomic,strong) NSLock *py_invocationLock;


@end

@implementation PYInvocation
@synthesize target = _target;
@synthesize selector = _selector;

+ (PYInvocation *)invocationWithMethodSignature:(NSMethodSignature *)sig {
    PYInvocation *py_invocation = [PYInvocation new];
    py_invocation.invocation = [NSInvocation invocationWithMethodSignature:sig];
    return py_invocation;
}
- (void)setArgumentWith_CFPointer: (void*) cfpointer andIndex: (NSInteger) i {
    [self.py_ArrayLock lock];
    NSString *key = [NSString stringWithFormat:@"%ld",i];
    if (key) {
        PYInvocation_RetrurnID_Argument *objArgument = [PYInvocation_RetrurnID_Argument new];
        
        objArgument.objArgument = cfpointer;
        self.py_array[key] = objArgument;
        [self setArgument:&cfpointer atIndex:i];
    }
    [self.py_ArrayLock unlock];
}

- (void)invoke {
    [self.invocation invoke];
    BOOL py_isPrintfLogWithMethodPraserCallMethodSuccess = [PYMethodParserConfig get_isPrintfLogWithMethodPraserCallMethodSuccess];
    if (py_isPrintfLogWithMethodPraserCallMethodSuccess) {
        py_DLog(@" \n\
                \n    ✅ PYInvocation调用方法成功 \
                \n    【target:】%@\
                \n    【SEL:】%@"
                ,self.target
                ,NSStringFromSelector(self.selector));
    }
    
}
- (void)invokeWithTarget:(id)target {
    [self.invocation invokeWithTarget:target];
    BOOL py_isPrintfLogWithMethodPraserCallMethodSuccess;
    if (py_isPrintfLogWithMethodPraserCallMethodSuccess) {
        py_DLog(@" \n\
                \n    ✅ PYInvocation调用方法成功 \
                \n    【target:】%@\
                \n    【SEL:】%@"
                ,target
                ,NSStringFromSelector(self.selector));
    }
}

// MARK: - invocation funcs
- (NSMethodSignature *)methodSignature {
    return self.invocation.methodSignature;
}

- (void)retainArguments {
    [self.invocation retainArguments];
}
- (BOOL) argumentsRetained {
    return self.invocation.argumentsRetained;
}

- (id)target {
    return self.invocation.target;
}
- (void) setTarget:(id)target {
    self.invocation.target = target;
}
- (void) setSelector:(SEL)selector {
    self.invocation.selector = selector;
}
- (SEL) selector {
    return self.invocation.selector;
}

- (void)getReturnValue:(void *)retLoc {
    [self.invocation getReturnValue:retLoc];
}
- (void)setReturnValue:(void *)retLoc {
    [self.invocation setReturnValue:retLoc];
}

- (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx {
    [self.invocation getArgument:argumentLocation atIndex:idx];
}
- (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx {
    [self.invocation setArgument:argumentLocation atIndex:idx];
}

// MARK: - get && set
- (NSMutableDictionary *)py_array {
    if (!_py_array) {
        _py_array = [NSMutableDictionary new];
    }
    return _py_array;
}
- (NSLock *)py_ArrayLock {
    if (!_py_ArrayLock) {
        _py_ArrayLock = [[NSLock alloc]init];
    }
    return _py_ArrayLock;
}

- (NSLock *)py_invocationLock {
    if (!_py_invocationLock) {
        _py_invocationLock = [NSLock new];
    }
    return _py_invocationLock;
}


// MARK:life cycles
- (void)dealloc {
    py_DLog(@" \n\
            \n    ✅ PYInvocation被销毁 \
            \n    【target:】%@\
            \n    【SEL:】%@\
            \n "
            ,self.target
            ,NSStringFromSelector(self.selector));
}
@end

