//
//  PYGradientViewController.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/12/21.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYGradientViewController.h"
#import <PYKitHeaders.h>
@interface PYGradientViewController ()
@property (nonatomic,strong) PYGradientView *gradientView;
@end

@implementation PYGradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gradientView = [PYGradientView new];
    CGRect gradientViewFrame = self.view.bounds;
    self.gradientView.frame = gradientViewFrame;
    [self.view addSubview:self.gradientView];
    
    
    UIButton *button = [UIButton new];
    UIButton *button2 = [UIButton new];
    
    CGRect buttonFrame = CGRectMake(20, gradientViewFrame.size.height - 60,100, 40);
    button.frame = buttonFrame;
    buttonFrame.origin.x += 140;
    button2.frame = buttonFrame;
    [self.view addSubview:button];
    [self.view addSubview:button2];
    
    [button setTitle:@"线性渲染" forState:UIControlStateNormal];
    [button2 setTitle:@"扩散渲染" forState:UIControlStateNormal];
    
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [button2 setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    
    button.layer.cornerRadius = 6;
    button.layer.borderWidth = 1;
    button.layer.borderColor = UIColor.whiteColor.CGColor;
    
    button2.layer.cornerRadius = 6;
    button2.layer.borderWidth = 1;
    button2.layer.borderColor = UIColor.whiteColor.CGColor;
    
    [button addTarget:self action:@selector(clickLineButton) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(clickRadiusButton) forControlEvents:UIControlEventTouchUpInside];
    return;
}

- (void) clickLineButton {
    [self.gradientView drawLineGradient:^(PYGradientViewLineConfig *lineConfig) {
        lineConfig
        .setUpScaleEndCenter(CGPointMake(0, 0))
        .setUpScaleStartCenter(CGPointMake(1, 1))
        .setUpColorArray(@[
                           UIColor.redColor,
                           UIColor.cyanColor
                           ])
        .setUpLocationArray(@[
                              @0,@1
                              ]);
        
    }];
}
- (void) clickRadiusButton {
    [self.gradientView drawRadialGradient:^(PYGradientViewDrawRadialConfig *radialConfig) {
        radialConfig
        .setUpScaleEndCenter(CGPointMake(0.5, 0.5))
        .setUpScaleStartCenter(CGPointMake(0.5, 0.5))
        .setUpColorArray(@[
                           UIColor.redColor,
                           UIColor.blueColor
                           ])
        .setUpStartRadius(0)
        .setUpEndRadius(1000)
        .setUpLocationArray(@[@0.1,@1]);
    }];
    
}

@end
