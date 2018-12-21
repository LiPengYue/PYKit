//
//  PYStringSizeViewController.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/13.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYStringSizeViewController.h"
#import <PYKit/UIImage+ChangeColor.h>
@interface PYStringSizeViewController ()
@property (nonatomic,strong) UIView *containerAnimationView;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UIImageView *imageView;
@end
extern uint64_t dispatch_benchmark(size_t count, void (^block)(void));
@implementation PYStringSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupAnimation];
    [self setupViews];
}
- (void) setupAnimation {
    self.presentConfig
    .setUpDismissStyle(DismissAnimationStyleBottom_Up)
    .setUpPresentStyle(PresentAnimationStyleUp_Bottom)
    .setUpIsLinkage(true);
    
    self.animationView = self.containerAnimationView;
}

- (void) setupViews {
    
    self.view
    .addSubView(self.containerAnimationView);
    self.containerAnimationView
    .addSubView(self.label)
    .addSubView(self.button)
    .addSubView(self.textView);
    
    [self.containerAnimationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(self.view).offset(100);
        make.width.height.equalTo(@0);
    }];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.mas_bottom).offset(10);
        make.left.equalTo(self.label);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@40);
    }];

    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(self.button);
        make.bottom.equalTo(self.view);
        make.top.equalTo(self.button.mas_bottom);
    }];
}

- (void) clickButton {
    
}


// MARK: - animation View
- (UIView *)containerAnimationView {
    if (!_containerAnimationView) {
        _containerAnimationView = [UIView new];
        _containerAnimationView.py_setUpBackgroundColor(UIColor.whiteColor);
    }
    return _containerAnimationView;
}

/// - label label
- (UILabel *) label {
    if (!_label) {
        _label = [UILabel new];
        CGFloat labelH = 100;
        CGFloat labelW = 0;
        _label
        .py_setUpBorderColor(UIColor.redColor)
        .py_setUpBorderWidth(0.5)
        .py_setUpFrame(CGRectMake(0, 100, labelW, labelH));
        _label.numberOfLines = 0;
    }
    return _label;
}
- (UITextView *)textView {
    if(!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectZero];
        _textView
        .py_setUpBorderColor(UIColor.redColor)
        .py_setUpBorderWidth(0.5);
    }
    return _textView;
}
/// - button Button
- (UIButton *) button {
    if (!_button) {
        _button = [UIButton new];
       
        [_button addTarget:self action:@selector(click_button) forControlEvents:UIControlEventTouchUpInside];
        _button
        .py_setUpTitle(@"赋值")
        .py_setUpFont(UIFont.fontSCR(20))
        .py_setUpFrame(CGRectMake(100, 300, 100, 100))
        .py_setUpBackgroundColor(UIColor.grayColor);
    }
    return _button;
}
- (void)click_button {
    CGFloat labelH = 100;
    CGFloat labelW = self.view.frame.size.width-20;
    NSMutableAttributedString *str = self.textView.text.createAttributedStr;
    str =
    @""
    .createAttributedStr
    .append(str)
    .setUpColor(UIColor.redColor)
    .setUpFont(UIFont.fontSCR(20));

    labelH = str.getHeightWithMaxW(labelW);
    [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(labelW));
        make.height.equalTo(@(labelH));
    }];
    self.label.attributedText = str;
}
@end
