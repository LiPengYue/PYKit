//
//  PaySuccessGuessYouLikeCollectionViewCell.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/26.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PaySuccessGuessYouLikeCollectionViewCell.h"
#import <PYKitHeaders.h>
@interface PaySuccessGuessYouLikeCollectionViewCell ()
@property (nonatomic,strong) UIImageView *goodsImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *frontMoneyLabel;
@property (nonatomic,strong) UILabel *currentMoneyLabel;
@end

@implementation PaySuccessGuessYouLikeCollectionViewCell

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}


#pragma mark - functions

- (void) setup {
    [self setupView];
    [self registerEvents];
    [self setUpFrontMoneyLabel:@"600"];
    [self setupCurrentMoneyLabel:@"400"];
}
// MARK: network

- (void) setupCurrentMoneyLabel: (NSString *)str {
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:@"￥"];
    [attri addAttribute:NSFontAttributeName value:UIFont.fontSCR(10) range:NSMakeRange(0, attri.length)];
    NSMutableAttributedString *countAttri = [[NSMutableAttributedString alloc]initWithString:str];
    [countAttri addAttribute:NSFontAttributeName value:UIFont.fontSCR(16) range:NSMakeRange(0, str.length)];
    [attri appendAttributedString:countAttri];
    UIColor *color = [UIColor colorWithRed:255/255  green:84/255  blue:75/255 alpha:1];
    [attri addAttribute:NSForegroundColorAttributeName value: color range:NSMakeRange(0, attri.length)];
    self.currentMoneyLabel.attributedText = attri;
    
    
}
- (void) setUpFrontMoneyLabel: (NSString *)str {
    str = [NSString stringWithFormat:@"￥%@",str];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:str];
    UIColor *color = [UIColor colorWithRed:175/255.0  green:175/255.0  blue:175/255.0 alpha:1];
    UIFont*font = UIFont.fontSCR(13);// UIFont.fontRobotoCondensedR(13);
    NSDictionary *dic = @{
                          NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle),
                          NSStrikethroughColorAttributeName : color,
                          NSBaselineOffsetAttributeName : @0,
                          NSForegroundColorAttributeName: color,
                          NSFontAttributeName:font
                          };

    [attributedStr addAttributes:dic range:NSMakeRange(0, str.length)];
    self.frontMoneyLabel.attributedText = attributedStr;
}

// MARK: handle views
- (void) setupView {
    
    self.goodsImageView.image = [UIImage imageNamed:@"1"];
    self.titleLabel.text = @"鸵鸟，西瓜一起吃，西瓜一起吃";
    
    [self.contentView addSubview: self.goodsImageView];
    [self.contentView addSubview: self.titleLabel];
    [self.contentView addSubview: self.frontMoneyLabel];
    [self.contentView addSubview: self.currentMoneyLabel];
     
    [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-81);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goodsImageView).offset(5);
        make.right.equalTo(self.goodsImageView.mas_right).offset(-5);
        make.top.equalTo(self.goodsImageView.mas_bottom).offset(8);
        make.height.equalTo(@16);
    }];
    [self.currentMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(5);
        make.height.equalTo(@12);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
    }];
    [self.frontMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.currentMoneyLabel.mas_right).offset(8);
        make.right.equalTo(self.contentView).offset(5);
        make.top.bottom.equalTo(self.currentMoneyLabel);
    }];
    [self.currentMoneyLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.frontMoneyLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
}

// MARK: handle event
- (void) registerEvents {
    
}

// MARK: properties get && set

- (UIImageView *) goodsImageView {
    if (!_goodsImageView) {
        _goodsImageView = [UIImageView new];
        //        _themeImageView.userInteractionEnabled = true;
        _goodsImageView.contentMode = UIViewContentModeScaleAspectFill;
        _goodsImageView.layer.masksToBounds = true;
        _goodsImageView.layer.cornerRadius = 6;
    }
    return _goodsImageView;
}

/// - titleLabel label
- (UILabel *) titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = UIFont.fontSCL(12);
        CGFloat color = 51/255.0;
        _titleLabel.textColor = [UIColor colorWithRed:color green:color blue:color alpha:1];
    }
    return _titleLabel;
}

/// - frontMoneyLabel label
- (UILabel *) frontMoneyLabel {
    if (!_frontMoneyLabel) {
        _frontMoneyLabel = [UILabel new];
        _frontMoneyLabel.textAlignment = NSTextAlignmentLeft;
        _frontMoneyLabel.font = UIFont.fontSCR(10);
        _frontMoneyLabel.textColor =  [UIColor colorWithRed:175/255.0  green:175/255.0  blue:175/255.0 alpha:1];
    }
    return _frontMoneyLabel;
}

/// - currentMoneyLabel label
- (UILabel *) currentMoneyLabel {
    if (!_currentMoneyLabel) {
        _currentMoneyLabel = [UILabel new];
        _currentMoneyLabel.textAlignment = NSTextAlignmentLeft;
        _currentMoneyLabel.font = UIFont.fontSCR(10);
        _currentMoneyLabel.textColor = [UIColor colorWithRed:255/255  green:84/255  blue:75/255 alpha:1];
    }
    return _currentMoneyLabel;
}

// MARK:life cycles


@end
