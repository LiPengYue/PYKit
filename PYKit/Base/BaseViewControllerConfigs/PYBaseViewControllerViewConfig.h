//
//  PYBaseViewControllerConfig.h
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/12/4.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PYBaseViewControllerViewConfig : NSObject
// 默认为黑色 defaul
@property (nonatomic,assign) UIStatusBarStyle statusBarStyle;
/// navigationbar是否透明 默认为不透明
@property (nonatomic,assign) BOOL isHiddenNavigationBar;
///是否穿透 默认为不穿透
@property (nonatomic,assign) BOOL isTranslucent;

- (PYBaseViewControllerViewConfig *(^)(UIStatusBarStyle style)) setupBarStyle;
- (PYBaseViewControllerViewConfig *(^)(BOOL isHidden))setUpIsHiddenNavigationBar;
- (PYBaseViewControllerViewConfig *(^)(BOOL)) setUpTranslucent;

@end
