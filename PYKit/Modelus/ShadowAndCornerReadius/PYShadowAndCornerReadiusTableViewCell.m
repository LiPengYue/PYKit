//
//  PYShadowAndCornerReadiusTableViewCell.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/14.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYShadowAndCornerReadiusTableViewCell.h"
#import "BaseFilletShadowView.h"
#import "PYMaskToBoundsView.h"
#import <PYKitHeaders.h>

@interface PYShadowAndCornerReadiusTableViewCell ()
@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong) BaseFilletShadowView *baseFilletShadowView;
@property (nonatomic,strong) PYMaskToBoundsView *maskToBoundsView;


@end
@implementation PYShadowAndCornerReadiusTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
self.maskToBoundsView = [PYMaskToBoundsView new];
        self.baseFilletShadowView = [BaseFilletShadowView new];
    }
    return self;
}

- (void) setIsShow_roundCornerView:(BOOL)isShow_roundCornerView {
    _isShow_roundCornerView = isShow_roundCornerView;
    [self setup];
}
- (void) setup {
    self.indexLabel.frame = CGRectMake(0, 0, 100, 30);
    [self.contentView addSubview:self.indexLabel];
    if (self.isShow_roundCornerView) {
        [self setup_roundCornerView];
        return;
    }
    [self setUp_maskToBoundsView];
        
}

- (void) setup_roundCornerView {
    
    [self.contentView addSubview: self.baseFilletShadowView];
    
    for (int i = 0 ; i < 4; i++) {
        
        [self addImage:self.baseFilletShadowView.containerView];
    }
    [self.baseFilletShadowView.containerView addSubview:self.imageV];
    
    
    [self.baseFilletShadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(5);
       make.top.equalTo(self.contentView).offset(30); make.bottom.equalTo(self.contentView).offset(-5);
        make.width.equalTo(self.baseFilletShadowView.mas_height);
    }];
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.baseFilletShadowView.containerView);
    }];
    
    self.baseFilletShadowView
    .config
    .setUpRadius(12)
    .setUpLeftTopAddRadius(20);
    self.baseFilletShadowView.containerView.backgroundColor = UIColor.whiteColor;
    [self setupShadow:self.baseFilletShadowView.shadowLayer];
    [self.baseFilletShadowView reCut];
}


- (void) setUp_maskToBoundsView {
    
    
    [self.contentView addSubview:self.maskToBoundsView];
    
    
    for (int i = 0 ; i < 4; i++) {
        
        [self addImage:self.maskToBoundsView.containerView];
    }
    [self.maskToBoundsView.containerView addSubview:self.imageV];
    
    [self.maskToBoundsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(5);
        make.top.equalTo(self.contentView).offset(30); make.bottom.equalTo(self.contentView).offset(-5);
        make.width.equalTo(self.maskToBoundsView.mas_height);
    }];
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.maskToBoundsView);
    }];
    self.maskToBoundsView.containerView.layer.cornerRadius = 12;
    self.maskToBoundsView.containerView.layer.masksToBounds = true;
    [self setupShadow:self.maskToBoundsView.layer];
}


- (void) addImage: (UIView *)view {
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"1"];
    
    [view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
    }];
}
- (void) setupShadow:(CALayer *)layer {
    layer.shadowOpacity = 1;
    layer.shadowColor = UIColor.blueColor.CGColor;
    layer.shadowOffset = CGSizeMake(10, 10);
}

- (UIImageView *) imageV {
    if (!_imageV) {
        _imageV = [UIImageView new];
        _imageV.contentMode = UIViewContentModeScaleAspectFill;
        _imageV.image = [UIImage imageNamed:@"1"];
    }
    return _imageV;
}

/// - label label
- (UILabel *) indexLabel {
    if (!_indexLabel) {
        _indexLabel = [UILabel new];
        _indexLabel.textAlignment = NSTextAlignmentLeft;
        _indexLabel.font = [UIFont systemFontOfSize:20];
        _indexLabel.textColor = [UIColor blueColor];
    }
    return _indexLabel;
}

@end
