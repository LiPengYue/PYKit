//
//  PYBaseViewControllerConfig.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/12/4.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYBaseViewControllerViewConfig.h"

@implementation PYBaseViewControllerViewConfig
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.statusBarStyle = UIStatusBarStyleDefault;
        self.isTranslucent = false;
    }
    return self;
}

- (PYBaseViewControllerViewConfig *(^)(UIStatusBarStyle style)) setupBarStyle {
    return ^(UIStatusBarStyle style) {
        self.statusBarStyle = style;
        return self;
    };
}
- (PYBaseViewControllerViewConfig *(^)(BOOL isHidden))setUpIsHiddenNavigationBar {
    return ^ (BOOL isHidden) {
        self.isHiddenNavigationBar = isHidden;
        return self;
    };
}
- (PYBaseViewControllerViewConfig *(^)(BOOL isTranslucent)) setUpTranslucent {
    return ^(BOOL isTranslucent) {
        self.isTranslucent = isTranslucent;
        return self;
    };
}
@end
