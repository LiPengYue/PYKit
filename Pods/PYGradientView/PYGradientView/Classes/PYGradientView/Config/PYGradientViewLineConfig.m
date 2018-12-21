//
//  PYGradientViewLineConfig.m
//  LYPCALayer
//
//  Created by 李鹏跃 on 2018/11/27.
//  Copyright © 2018年 13lipengyue. All rights reserved.
//

#import "PYGradientViewLineConfig.h"

@implementation PYGradientViewLineConfig
/**
 内部装的是颜色数组
 */
- (PYGradientViewLineConfig *(^)(NSArray <UIColor *> *colorArray))setUpColorArray {
    return ^(NSArray <UIColor *> *colorArray) {
        self.colorArray = colorArray;
        return self;
    };
}
/**
 内部装的是NSNumber化的CGFloat
 */
- (PYGradientViewLineConfig *(^)(NSArray <NSNumber *>*locationArray)) setUpLocationArray{
    return ^(NSArray <NSNumber *>*locationArray) {
        self.locationArray = locationArray;
        return self;
    };
}
/**
 * 终点位置（通常和起始点相同，否则会有偏移）
 */
- (PYGradientViewLineConfig *(^)(CGPoint endCenter)) setUpEndCenter {
    return ^(CGPoint end) {
        self.endCenter = end;
        return self;
    };
}
/**
 * 起始点位置
 */
- (PYGradientViewLineConfig *(^)(CGPoint startCenter)) setUpStartCenter {
    return ^(CGPoint start) {
        self.startCenter = start;
        return self;
    };
}

- (PYGradientViewLineConfig *(^)(CGPoint endCenter)) setUpScaleStartCenter {
    return ^(CGPoint start) {
        self.startScaleCenter = start;
        return self;
    };
}
- (PYGradientViewLineConfig *(^)(CGPoint endCenter)) setUpScaleEndCenter {
    return ^(CGPoint end) {
        self.endScaleCenter = end;
        return self;
    };
}
- (PYGradientViewLineConfig *(^)(CGGradientDrawingOptions options)) setUpOptions {
    return ^(CGGradientDrawingOptions options) {
        self.options = options;
        return self;
    };
}
@end
