//
//  AppDelegate.h
//  StarAnimation
//
//  Created by 李鹏跃 on 17/1/24.
//  Copyright © 2017年 13lipengyue. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "PYGradientViewDrawRadialConfig.h"
#import "PYGradientViewLineConfig.h"

@interface PYGradientView : UIView
- (void) drawLineGradient: (void(^)(PYGradientViewLineConfig *lineConfig))drawLine;
- (void) drawRadialGradient: (void(^)(PYGradientViewDrawRadialConfig *radialConfig))drawRadial;
@end
