//
//  BaseViewController.h
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/10/10.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PYBaseViewControllerViewConfig.h"
@interface PYBaseViewController : UIViewController
@property (nonatomic,strong) PYBaseViewControllerViewConfig *viewWillAppearConfig;
@property (nonatomic,strong) PYBaseViewControllerViewConfig *viewWillDisappearConfig;
- (void) updateStatusBarStyle:(UIStatusBarStyle)style;
@end
