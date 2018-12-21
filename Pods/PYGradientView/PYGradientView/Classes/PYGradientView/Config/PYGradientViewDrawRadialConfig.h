//
//  PYGradientViewDrawRadialConfig.h
//  LYPCALayer
//
//  Created by 李鹏跃 on 2018/11/26.
//  Copyright © 2018年 13lipengyue. All rights reserved.
//

#import "PYGradientViewBaseConfig.h"

/// 扩散填充数据
@interface PYGradientViewDrawRadialConfig : PYGradientViewBaseConfig

/// 起始半径（通常为0，否则在此半径范围内容无任何填充）
@property (nonatomic,assign) CGFloat startRadius;
/// 终点半径（也就是渐变的扩散长度）
@property (nonatomic,assign) CGFloat endRadius;


//MARK: - 链式调用函数
/// 最小半径（通常为0，否则在此半径范围内容无任何填充）
- (PYGradientViewDrawRadialConfig *(^)(CGFloat startRadius)) setUpStartRadius;

/// 最大圆半径（也就是渐变的扩散长度）
- (PYGradientViewDrawRadialConfig *(^)(CGFloat endRadius)) setUpEndRadius;

/** 绘制方式,
 
 kCGGradientDrawsBeforeStartLocation 开始位置之前就进行绘制，但是到结束位置之后不再绘制，
 kCGGradientDrawsAfterEndLocation开始位置之前不进行绘制，但到结束点之后继续填充
 */
- (PYGradientViewDrawRadialConfig *(^)(CGGradientDrawingOptions options)) setUpOptions;
/**
 内部装的是颜色数组
 */
- (PYGradientViewDrawRadialConfig *(^)(NSArray <UIColor *> *colorArray))setUpColorArray;
/**
 内部装的是NSNumber化的CGFloat
 */
- (PYGradientViewDrawRadialConfig *(^)(NSArray <NSNumber *>*locationArray)) setUpLocationArray;
/**
 * 终点位置（通常和起始点相同，否则会有偏移）
 */
- (PYGradientViewDrawRadialConfig *(^)(CGPoint endCenter)) setUpEndCenter;
/**
 * 起始点位置
 */
- (PYGradientViewDrawRadialConfig *(^)(CGPoint startCenter)) setUpStartCenter;
/**
 * 相对起点位置
 * @warning startScaleCenter.x = self.center.x / self.width
 
 * startScaleCenter.y = self.center.y / self.height
 */
- (PYGradientViewDrawRadialConfig *(^)(CGPoint endCenter)) setUpScaleStartCenter;
/**
 * 相对终点位置
 * @warning endScaleCenter.x = self.center.x / self.width
 
 * endScaleCenter.y = self.center.y / self.height
 */
- (PYGradientViewDrawRadialConfig *(^)(CGPoint endCenter)) setUpScaleEndCenter;
@end
