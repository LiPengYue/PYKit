//
//  PYPaySuccessHeaderView.h
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/26.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaySuccessHeaderView : UIView
/** 点击了继续购物 */
- (void) clickGoShopping: (void(^)(void))block;

/** 点击了查看订单*/
- (void) clickLookOrder: (void(^)(void))block;

@property (nonatomic,copy) NSString *moneyString;
@end
