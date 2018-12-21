//
//  PYBaseFlashView.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/10/27.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYBaseFlashView.h"
@interface PYBaseFlashView ()
@property (nonatomic,strong) UIButton *backGroundButton;
@property (nonatomic,strong) CAGradientLayer *center_outSideGradientLayer;
@property (nonatomic,strong) CAGradientLayer *outSideCenterGradientLayer;
@property (nonatomic,strong) CAShapeLayer *shapeLayer;
@end
@implementation PYBaseFlashView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self py_setUp];
    }
    return self;
}


#pragma mark - functions

- (void) py_setUp {
    [self py_setUpView];
    [self registerEvents];
}
// MARK: network


// MARK: handle views
- (void) py_setUpView {
    
}

// MARK: handle event
- (void) registerEvents {
    
}

// MAKR: - ther func
- (void) beginAnimation {
    
}
- (void) stopAnimation {
    
}

// MARK: properties get && set



// MARK:life cycles
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    // 从中心到四周的颜色渐变
}
#pragma mark 径向渐变
-(void)drawRadialGradient:(CGContextRef)context{
    //使用rgb颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    /*指定渐变色
     space:颜色空间
     components:颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
     如果有三个颜色则这个数组有4*3个元素
     locations:颜色所在位置（范围0~1），这个数组的个数不小于components中存放颜色的个数
     count:渐变个数，等于locations的个数
     */
    
    CGFloat compoents[12]={
        248.0/255.0,86.0/255.0,86.0/255.0,1,
        249.0/255.0,127.0/255.0,127.0/255.0,1,
        1.0,1.0,1.0,1.0
    };
    CGFloat locations[3]={0,0.3,1.0};
    CGGradientRef gradient= CGGradientCreateWithColorComponents
    (
     colorSpace,
     compoents,
     locations,
     3
     );
    
    /*绘制径向渐变
     context:图形上下文
     gradient:渐变色
     startCenter:起始点位置
     startRadius:起始半径（通常为0，否则在此半径范围内容无任何填充）
     endCenter:终点位置（通常和起始点相同，否则会有偏移）
     endRadius:终点半径（也就是渐变的扩散长度）
     options:绘制方式,kCGGradientDrawsBeforeStartLocation 开始位置之前就进行绘制，但是到结束位置之后不再绘制，
     kCGGradientDrawsAfterEndLocation开始位置之前不进行绘制，但到结束点之后继续填充
     */
    CGContextDrawRadialGradient
    (
     context,
     gradient,
     CGPointMake(160, 284),
     0,
     CGPointMake(165, 289),
     150,
     kCGGradientDrawsAfterEndLocation
     );
    
    //释放颜色空间
    CGColorSpaceRelease(colorSpace);
}

/// - centerButton Button
- (UIButton *) centerButton {
    if (!_centerButton) {
        _centerButton = [UIButton new];
        [_centerButton addTarget:self action:@selector(click_centerButtonButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerButton;
}
- (void)click_centerButtonButton {
    
}
/// - backGroundButton Button
- (UIButton *) backGroundButton {
    if (!_backGroundButton) {
        _backGroundButton = [UIButton new];
        [_backGroundButton addTarget:self action:@selector(click_backGroundButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backGroundButton;
}
- (void)click_backGroundButton {
    
}

- (CAShapeLayer *)shapeLayer {
    if(!_shapeLayer) {
        _shapeLayer = [[CAShapeLayer alloc]init];
        _shapeLayer.fillColor = UIColor.clearColor.CGColor;
    }
    return _shapeLayer;
}

@end
