//
//  PYPaySuccessCuessYouLikeCollectionReusableView.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/27.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYPaySuccessCuessYouLikeCollectionReusableView.h"
#import <PYKitHeaders.h>
@interface PYPaySuccessCuessYouLikeCollectionReusableView ()

@property (nonatomic,strong) UILabel *titleLabel;
@end
@implementation PYPaySuccessCuessYouLikeCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void) setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void) setup {
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@14);
        make.top.equalTo(@26);
    }];
}


/// - title label
- (UILabel *) titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = UIFont.fontSCM(16);
        CGFloat colorScale = 51.0/255.0;
        _titleLabel.textColor = [UIColor colorWithRed:colorScale green:colorScale blue:colorScale alpha:1];
    }
    return _titleLabel;
}
@end
