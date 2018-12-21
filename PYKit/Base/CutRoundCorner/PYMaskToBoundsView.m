//
//  PYRoundCorner.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/14.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYMaskToBoundsView.h"
#import <Masonry/Masonry.h>
@implementation PYMaskToBoundsView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.containerView];
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}
- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [UIView new];
    }
    return _containerView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

@end
