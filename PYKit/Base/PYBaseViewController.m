//
//  BaseViewController.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/10/10.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYBaseViewController.h"

@interface PYBaseViewController ()
@property (nonatomic,assign) UIStatusBarStyle statusBarStyle;
@end

@implementation PYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"🔙" style:UIBarButtonItemStylePlain target:self action:@selector(clickBackButton)];
}

- (void) clickBackButton {
    [self.navigationController popViewControllerAnimated:true];
}

- (PYBaseViewControllerViewConfig *)viewWillDisappearConfig {
    if (!_viewWillDisappearConfig) {
        _viewWillDisappearConfig = [PYBaseViewControllerViewConfig new];
    }
    return _viewWillDisappearConfig;
}

- (PYBaseViewControllerViewConfig *)viewWillAppearConfig {
    if (!_viewWillAppearConfig) {
        _viewWillAppearConfig = [PYBaseViewControllerViewConfig new];
    }
    return _viewWillAppearConfig;
}

- (void) setStatusBarStyle:(UIStatusBarStyle)statusBarStyle {
    _statusBarStyle = statusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void) updateStatusBarStyle:(UIStatusBarStyle)style {
    self.statusBarStyle = style;
}
- (void)dealloc
{
    NSLog(@"✅ 释放：%@", NSStringFromClass([self class]));
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return self.statusBarStyle;
}
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];

    self.statusBarStyle = self.viewWillAppearConfig.statusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];

    [self.navigationController setNavigationBarHidden:self.viewWillAppearConfig.statusBarStyle animated:animated];
    self.navigationController.navigationBar.translucent = self.viewWillAppearConfig.isTranslucent;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

@end
