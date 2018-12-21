//
//  PYFoldButtonsViewController.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/10/10.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYFoldButtonsViewController.h"
#import "PYKitHeaders.h"
#import "PYImageView.h"
#import <Masonry/Masonry.h>

@interface PYFoldButtonsViewController ()
@property (nonatomic,strong) FoldButtonsView *foldButtonsView;
@property (nonatomic,strong) UILabel *leftLabel;
@property (nonatomic,strong) UILabel *midLabel;
@property (nonatomic,strong) UILabel *rightLabel;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) PYImageView *imgView;
@end

@implementation PYFoldButtonsViewController

#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview: self.foldButtonsView];
    [self.view addSubview:self.leftLabel];
    [self.view addSubview:self.midLabel];
    [self.view addSubview:self.rightLabel];
    
    NSNumber *top = @(80).isX(100).is5(70);
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(top);
        make.left.equalTo(@10);
    }];
    [self.midLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.leftLabel);
        make.left.equalTo(self.leftLabel.mas_right).offset(10);
    }];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.midLabel);
        make.left.equalTo(self.midLabel.mas_right).offset(10);
        make.right.equalTo(self.view).offset(-10);
    }];
    
    [self.foldButtonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.rightLabel.mas_bottom).offset(80);
        make.height.equalTo(@80);
        make.right.equalTo(self.view).offset(-20);
    }];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:0.1 animations:^{
    }completion:^(BOOL finished) {
        [self.foldButtonsView reloadDataToIndex:8 block:^(NSInteger index, UIButton *button) {
            [button py_setUpStyle:UIControlStateNormal style:^(UIButton *button) {
                UIImage *image = [UIImage imageNamed:@"".addInt(index)];
                button
                .py_setUpImage(image)
                .py_setUpBackgroundColor(UIColor.whiteColor)
                .py_setUpTitleColor(UIColor.whiteColor)
                .py_setUpBorderWidth(2)
                .py_setUpBorderColor(UIColor.whiteColor)
                .py_setUpFont([UIFont systemFontOfSize:24])
                .py_setUpMasksToBounds(true)
                .py_setUpCornerRadius(button.frame.size.width/2.0);
            }];
        }];
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
   
    NSString *str = [PYFoldButtonsViewController setDefault:@"haha"](nil);
    NSLog(@"%@",str);
    return;
    
    self.foldButtonsView.setConfig(self.foldButtonsView.config);
    UIView *view = nil;
    if (view.py_setUpBackgroundColor) {
        view.py_setUpBackgroundColor(UIColor.redColor);
    }
    
    
    [self.foldButtonsView reloadDataToIndex:3 block:^(NSInteger index, UIButton *button) {
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + index;
        button
        .py_setUpBackgroundColor(UIColor.whiteColor)
        .py_setUpTitleColor(UIColor.redColor)
        .py_setUpTitle(@"".addInt(index))
        .py_setUpBorderWidth(2)
        .py_setUpBorderColor(UIColor.redColor)
        .py_setUpFont([UIFont systemFontOfSize:24])
        .py_setUpMasksToBounds(true)
        .py_setUpCornerRadius(button.frame.size.width/2.0);
    }];
}

- (void)clickButton: (UIButton *)button {
    
    NSInteger tag = (button.tag - 100);
    UIImage *image = [UIImage imageNamed:@"0"];
    self.imageView.py_setUpBackgroundColor(UIColor.whiteColor);
    switch (tag) {
            case 0:
            self.leftLabel
            .py_setUpText(self.leftLabel.text.addObjc(@"😝"));
            image = [UIImage imageByStyle:image type:UIImageChangeColorSyleEnum_AntiColor];
            self.imageView.image = image;
            
            break;
            case 1:
            self.midLabel
            .py_setUpText(self.midLabel.text.addObjc(@"💉"));
//            image = [UIImage imageByStyle:image type:UIImageChangeColorSyleEnum_AntiColor];
            self.imageView.image = image;
            break;
        default:
            self.rightLabel
            .py_setUpText(self.rightLabel.text.addObjc(@"✅"));
            image = [UIImage imageByStyle:image type:UIImageChangeColorSyleEnum_Gray];
            self.imageView.image = image;
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (FoldButtonsView *) foldButtonsView {
    if (!_foldButtonsView) {
        _foldButtonsView = [FoldButtonsView new];
        FoldButtonsViewConfig *config = [FoldButtonsViewConfig new];
        
        config
        .setDeriction(FoldButtonsViewDerictionRight_Left)
        .setAligment(FoldButtonsViewAligment_right)
        .setEdge(UIEdgeInsetsMake(10, 10, 10, 10))// 编剧
        .setFoldDistance(20)//button重叠距离
        .setMaxButtonCount(5);
        
        //设置view的基本属性
        _foldButtonsView
        .setConfig(config)
        .py_setUpBorderColor(UIColor.redColor)
        .py_setUpBorderWidth(1)
        .py_setUpBackgroundColor(UIColor.whiteColor);
        
        // button创建的时候会调用，只有在改变maxButtonCount 的时候，才会重新创建button
        [_foldButtonsView py_setUpButtonWhenCreatingFunc:^(NSInteger index, UIButton *button) {
        }];
        _foldButtonsView.layer.shadowOffset = CGSizeMake(1, 1);
        _foldButtonsView.layer.shadowColor = UIColor.redColor.CGColor;
        _foldButtonsView.layer.shadowRadius = 6;
        _foldButtonsView.layer.shadowOpacity = 0.8;//阴影透明度，默认0
    }
    return _foldButtonsView;
}


/// - leftLabel label
- (UILabel *) leftLabel {
    if (!_leftLabel) {
        _leftLabel = [UILabel new];
        _leftLabel.textAlignment = NSTextAlignmentLeft;
        _leftLabel
        .py_setUpText(@"第一个")
        .py_setUpTextColorRGBA(23,22,39,0.6)
        .py_setUpAlignment(NSTextAlignmentLeft)
        .py_setUpUILayoutPriority(UILayoutPriorityRequired)
        .py_setUpUILayoutConstraintAxis(UILayoutConstraintAxisHorizontal)
        .py_setUpBorderColor(UIColor.redColor)
        .py_setUpBorderWidth(1)
        .py_setUpCornerRadius(4)
        .py_setUpMasksToBounds(true);
    }
    return _leftLabel;
}
- (UILabel *) midLabel {
    if (!_midLabel) {
        _midLabel = [UILabel new];
        _midLabel.textAlignment = NSTextAlignmentLeft;
        _midLabel
        .py_setUpText(@"第二个")
        .py_setUpTextColorRGBA(23,22,39,0.6)
        .py_setUpAlignment(NSTextAlignmentLeft)
        .py_setUpUILayoutPriority(UILayoutPriorityRequired)
        .py_setUpUILayoutConstraintAxis(UILayoutConstraintAxisHorizontal)
        .py_setUpBorderColor(UIColor.redColor)
        .py_setUpBorderWidth(1)
        .py_setUpCornerRadius(4)
        .py_setUpMasksToBounds(true);
    }
    return _midLabel;
}

- (UILabel *) rightLabel {
    if (!_rightLabel) {
        _rightLabel = [UILabel new];
        _rightLabel.textAlignment = NSTextAlignmentLeft;
        _rightLabel
        .py_setUpText(@"最后一个")
        .py_setUpTextColorRGBA(23,22,39,0.6)
        .py_setUpAlignment(NSTextAlignmentLeft)
        .py_setUpUILayoutPriority(UILayoutPriorityDefaultLow)
        .py_setUpUILayoutConstraintAxis(UILayoutConstraintAxisHorizontal)
        .py_setUpBorderColor(UIColor.redColor)
        .py_setUpBorderWidth(1)
        .py_setUpCornerRadius(4)
        .py_setUpMasksToBounds(true);
    }
    return _rightLabel;
}

- (UIImageView *) imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.frame = self.view.bounds;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.backgroundColor = @"#afafaf".conversionToColorFunc;
    }
    return _imageView;
}
//- (PYImageView *) imgView {
//    if (!_imgView) {
//        _imgView = [PYImageView new];
//        //        _themeImageView.userInteractionEnabled = true;
//        _imgView.contentMode = UIViewContentModeScaleAspectFit;
//        _imgView.layer.masksToBounds = true;
//        _imgView.layer.cornerRadius = 27;
//    }
//    return _imgView;
//}

+ (NSString *(^)(NSString *str)) setDefault: (NSString *)string {
    return ^(NSString *str) {
        if (!str) {
            return string;
        }
        return str;
    };
}
@end
