//
//  PYTransitionAnimaterViewController.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/12.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYTransitionAnimaterViewController.h"


@implementation PYTransitionAnimaterViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAnimation];
    [self setUpAnimationView];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];  
}
- (void) setUpAnimation {

    self.presentConfig
    .setUpPresentStyle(PresentAnimationStyleLeft_right)
    .setUpDismissStyle(DismissAnimationStyleRight_Left)
    
    .setUpBackgroundColor([UIColor colorWithWhite:0 alpha:0.3])
    
    .setUpPresentDuration(0.4)
    .setUpDismissDuration(0.4)
    
    .setUpDismissEndAlpha(1)
    .setUpPresentStartAlpha(1)
    
    .setUpIsLinkage(true);
    
    self.shadowAnimationConfig
    .setUpDismissShadowOffset(CGSizeMake(-1, 1))
    .setUpPresentShadowOffset(CGSizeMake(5, 5))
    
    .setUpPresentShadowColor([UIColor colorWithWhite:0 alpha:0.3])
    .setUpDismissShadowColor([UIColor colorWithWhite:0 alpha:0])
    
    .setUpPresentShadowOpacity(1)
    .setUpDismissShadowOpacity(0);
    
}
- (void) setUpAnimationView {
    
    UIView *animationView = [UIView new];
    [self.view addSubview:animationView];
    animationView.backgroundColor = UIColor.whiteColor;
    [animationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-200);
        make.left.top.bottom.equalTo(self.view);
    }];
    
    self.animationView = animationView;
}


@end
