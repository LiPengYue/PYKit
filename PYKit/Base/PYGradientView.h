//
//  PYGradientView.h
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/10/27.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PYGradientView : UIView

/** 是否为经向渐变 */
@property (nonatomic,assign) BOOL isRadialGradient;

// MARK: - 直线渐变


// MARK: - 经向渐变
/** 从内而外的颜色 默认为灰色*/
@property (nonatomic,strong) NSArray <UIColor *>*center_outsideColor;

/** 由外自内的颜色 默认为nil*/
@property (nonatomic,strong) NSArray <UIColor *>*outside_centerColor;


@end
