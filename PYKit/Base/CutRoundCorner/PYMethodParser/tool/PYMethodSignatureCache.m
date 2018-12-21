//
//  PYMethodSignatureCache.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/20.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYMethodSignatureCache.h"

@interface PYMethodSignatureCache ()
<NSCacheDelegate>

@end


@implementation PYMethodSignatureCache
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self py_setup_];
    }
    return self;
}

- (void) py_setup_ {
    self.delegate = self;
}

//MARK: - delegate
- (void)cache:(NSCache *)cache willEvictObject:(id)obj {
    
}

@end
