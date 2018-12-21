//
//  BasePresentNavigationController.h
//  yiapp
//
//  Created by 李鹏跃 on 2018/10/31.
//  Copyright © 2018年 yi23. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BasePresentViewControllerConfiguration;
@class BasePresentViewController;

typedef void(^ BasicAnimationBlock)(CABasicAnimation *animation);


@interface BasePresentNavigationController : UINavigationController

@property (nonatomic,strong,readonly) BasePresentViewController *presentViewController;
@end
