//
//  PYGradientViewBaseConfig.m
//  LYPCALayer
//
//  Created by 李鹏跃 on 2018/11/27.
//  Copyright © 2018年 13lipengyue. All rights reserved.
//

#import "PYGradientViewBaseConfig.h"

@implementation PYGradientViewBaseConfig
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.startScaleCenter = PYGradientViewConfigPointDefault;
        self.startCenter = PYGradientViewConfigPointDefault;
        self.endCenter = PYGradientViewConfigPointDefault;
        self.endScaleCenter = PYGradientViewConfigPointDefault;
    }
    return self;
}
@end
