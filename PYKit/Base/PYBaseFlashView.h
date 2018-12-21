//
//  PYBaseFlashView.h
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/10/27.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 闪烁的view 圆形的
 */
@interface PYBaseFlashView : UIView

@property (nonatomic,strong) UIButton *centerButton;

/** 从内而外的颜色 默认为灰色*/
@property (nonatomic,strong) NSArray <UIColor *>*center_outsideColor;

/** 由外自内的颜色 默认为nil*/
@property (nonatomic,strong) NSArray <UIColor *>*outside_centerColor;

/** 动画时长 默认为1s*/
@property (nonatomic,assign) CGFloat animationDuration;

- (void) beginAnimation;
- (void) stopAnimation;
@end

