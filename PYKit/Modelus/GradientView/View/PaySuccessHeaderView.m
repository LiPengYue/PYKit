//
//  PYPaySuccessHeaderView.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/26.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PaySuccessHeaderView.h"
#import <PYKitHeaders.h>
@interface PaySuccessHeaderView()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *moneyLabel;
@property (nonatomic,strong) UIButton *goShoppingButton;
@property (nonatomic,strong) UIButton *lookOrderButton;

@property (nonatomic,copy) void(^clickGoShopping)(void);
@property (nonatomic,copy) void(^clickOrderButton)(void);
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic,strong) UIView *gradientView;
@end

@implementation PaySuccessHeaderView


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
    self.moneyString = @"￥124";
}

// MARK: network
- (void) setMoneyString:(NSString *)moneyString {
    _moneyString = moneyString;
    NSString *moneyStringCopy = moneyString.copy;
    
    moneyStringCopy
    .deleteStr(@" ")
    .deleteStr(@"￥")
    .deleteStr(@"¥");
    
    self.moneyLabel.text = [NSString stringWithFormat:@"实付¥%@",moneyStringCopy];
}

// MARK: handle views
- (void) setupView {
    self.gradientView = [UIView new];
    [self addSubview:self.gradientView];
    [self addSubview: self.titleLabel];
    [self addSubview: self.moneyLabel];
    [self addSubview: self.goShoppingButton];
    [self addSubview: self.lookOrderButton];
    
    
    [self.gradientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.left.equalTo(self);
        make.centerX.equalTo(self).offset(-4);
        make.bottom.equalTo(self.mas_bottom).offset(-123);
        make.height.equalTo(@28);
    }];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self);
        make.centerX.equalTo(self);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.height.equalTo(@20);
    }];

    [self.goShoppingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.moneyLabel.mas_bottom).offset(30);
        make.right.equalTo(self.mas_centerX).offset(-9.5);
        make.width.equalTo(@110);
        make.height.equalTo(@36);
    }];

    [self.lookOrderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.top.bottom.equalTo(self.goShoppingButton);
        make.left.equalTo(self.mas_centerX).offset(9.5);
    }];

}

// MARK: handle event
- (void) registerEvents {
    
}

// MARK: properties get && set

/// - titleLabel label
- (UILabel *) titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = UIFont.fontSCM(20);
        _titleLabel.textColor = UIColor.whiteColor;
        _titleLabel.attributedText = [self getTitleStr];
    }
    return _titleLabel;
}

- (NSMutableAttributedString *) getTitleStr {
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:@"支付成功"];
    [attributedStr addAttributes:@{NSFontAttributeName:UIFont.fontSCM(20),NSForegroundColorAttributeName: UIColor.whiteColor} range:NSMakeRange(0, attributedStr.length)];
    //图片添加
    NSTextAttachment *attachment = [[NSTextAttachment alloc]init];
    UIFont *font = UIFont.fontSCM(26);
    UIImage *image = [UIImage imageNamed:@"YES_PaySuccess"];
    
    //计算图片大小，与文字同高，按比例设置宽度
    CGFloat imageH = font.pointSize;
    CGFloat imageW = (image.size.width / image.size.height) * imageH;
    
    //计算文字padding-top ，使图片垂直居中
    CGFloat textPaddingTop = (font.lineHeight - font.pointSize) / 2;
    
    attachment.image = image;
    attachment.bounds = CGRectMake(0, -textPaddingTop , imageW, imageH);
    NSMutableAttributedString *attachmentStr = [NSMutableAttributedString attributedStringWithAttachment:attachment].mutableCopy;
    NSMutableAttributedString *attachmentStrRrightSpaceStr = [[NSMutableAttributedString alloc]initWithString:@" "];
   
    [attachmentStrRrightSpaceStr addAttributes:@{NSKernAttributeName:@8,NSFontAttributeName: UIFont.fontSCL(0.1)} range:NSMakeRange(0, attachmentStrRrightSpaceStr.length)];
     [attachmentStr appendAttributedString:attachmentStrRrightSpaceStr];
    [attachmentStr appendAttributedString:attributedStr];
    
    
    return attachmentStr;
    
}

/// - moneyLabel label
- (UILabel *) moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel new];
        _moneyLabel.textAlignment = NSTextAlignmentCenter;
        _moneyLabel.font = UIFont.fontSCR(14);
        _moneyLabel.textColor = UIColor.whiteColor;
    }
    return _moneyLabel;
}

/// - goShoppingButton Button
- (UIButton *) goShoppingButton {
    if (!_goShoppingButton) {
        _goShoppingButton = [UIButton new];
        [_goShoppingButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _goShoppingButton.titleLabel.font = UIFont.fontSCR(14);
        [_goShoppingButton setTitle:@"继续购物" forState:UIControlStateNormal];
        [_goShoppingButton addTarget:self action:@selector(click_goShoppingButton) forControlEvents:UIControlEventTouchUpInside];
        _goShoppingButton.layer.borderWidth = 0.5;
        _goShoppingButton.layer.borderColor = UIColor.whiteColor.CGColor;
        _goShoppingButton.layer.cornerRadius = 18;
    }
    return _goShoppingButton;
}

- (void)click_goShoppingButton {
    if (self.clickGoShopping) {
        self.clickGoShopping();
    }
}

/// - lookOrderButton Button
- (UIButton *) lookOrderButton {
    if (!_lookOrderButton) {
        _lookOrderButton = [UIButton new];
        [_lookOrderButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _lookOrderButton.titleLabel.font = UIFont.fontSCR(14);
        [_lookOrderButton setTitle:@"查看订单" forState:UIControlStateNormal];
        [_lookOrderButton addTarget:self action:@selector(click_lookOrderButton) forControlEvents:UIControlEventTouchUpInside];
        _lookOrderButton.layer.borderWidth = 0.5;
        _lookOrderButton.layer.borderColor = UIColor.whiteColor.CGColor;
        _lookOrderButton.layer.cornerRadius = 18;
    }
    return _lookOrderButton;
}
- (void)click_lookOrderButton {
    if (self.clickOrderButton) {
        self.clickOrderButton();
    }
}

- (void) clickLookOrder:(void (^)(void))block {
    self.clickOrderButton = block;
}

- (void) clickGoShopping:(void (^)(void))block {
    self.clickGoShopping = block;
}


- (void)layoutSubviews {
    [super layoutSubviews];
//    self.backgroundColor = [UIColor colorWithRed: 253/255.0 green: 41/255.0  blue: 41/255.0  alpha:1];
//    return;
    // 添加渐变
    self.gradientLayer.frame = self.bounds;
    
//    _gradientLayer.type = kCAGradientLayerAxial;
}

- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer new];
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint = CGPointMake(1, 0.8);
        
        _gradientLayer.locations = @[@(-0.2),@0.15,@0.7];
        
        CGColorRef color1 = [UIColor colorWithRed: 1 green: 170/255.0  blue: 60/255.0  alpha:1].CGColor;
        CGColorRef color2 = [UIColor colorWithRed: 1 green: 120/255.0  blue: 120/255.0  alpha:1].CGColor;
        CGColorRef color3 = [UIColor colorWithRed: 253/255.0 green: 41/255.0  blue: 41/255.0  alpha:1].CGColor;
        _gradientLayer.colors = @[
                                  (__bridge id)color1,
                                  (__bridge id)color2,
                                  (__bridge id)color3
                                  ];
        [self.gradientView.layer addSublayer:_gradientLayer];
        
    }
    return _gradientLayer;
}

@end
