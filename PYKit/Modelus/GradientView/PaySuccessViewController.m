//
//  PaySuccessViewController.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/26.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PaySuccessViewController.h"
#import "PaySuccessHeaderView.h"
#import "PaySuccessGuessYouLikeCollectionView.h"
#import <PYKitHeaders.h>
@interface PaySuccessViewController ()
@property (nonatomic,strong) PaySuccessHeaderView *headerView;
@property (nonatomic,strong) PaySuccessGuessYouLikeCollectionView *collectionView;
@property (nonatomic,strong) UILabel *guessYouLikeLabel;
@property (nonatomic,assign) UIStatusBarStyle statusBarStyle;
@end

@implementation PaySuccessViewController

#pragma mark - init
- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewWillAppearConfig
    .setupBarStyle(UIStatusBarStyleLightContent);
//    .setUpTranslucent(true);
    [self setup];
}


#pragma mark - functions

- (void) setup {
    [self setupNav];
    [self setupView];
    [self registerEvents];
}
// MARK: network


// MARK: handle views
- (void) setupNav {
    
}

- (void) setupView {
    [self.view addSubview: self.headerView];
    [self.view addSubview:self.guessYouLikeLabel];
    [self.view addSubview:self.collectionView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@221);
    }];
    [self.guessYouLikeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(14);
        make.right.equalTo(self.view).offset(-14);
        make.height.equalTo(@22);
        make.top.equalTo(self.headerView.mas_bottom).offset(26);
        
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.headerView);
        make.top.equalTo(self.guessYouLikeLabel.mas_bottom).offset(14);
        make.bottom.equalTo(self.view);
    }];
}

// MARK: handle event
- (void) registerEvents {
    [self registerHeaderEvent];
}
- (void) registerHeaderEvent {
    __weak typeof(self) weakSelf = self;
    [self.headerView clickLookOrder:^{
        [weakSelf.navigationController pushViewController:[NSClassFromString(@"PYMethodParserViewController") new] animated:true];
    }];
    [self.headerView clickGoShopping:^{
        
    }];
}

// MARK: properties get && set
- (PaySuccessHeaderView *) headerView {
    if (!_headerView) {
        _headerView = [PaySuccessHeaderView new];
    }
    return _headerView;
}

- (PaySuccessGuessYouLikeCollectionView *) collectionView {
    if(!_collectionView) {
        _collectionView = [[PaySuccessGuessYouLikeCollectionView alloc] init];
    }
    return _collectionView;
}
- (UILabel *) guessYouLikeLabel {
    if (!_guessYouLikeLabel) {
        _guessYouLikeLabel = [UILabel new];
        _guessYouLikeLabel.textAlignment = NSTextAlignmentLeft;
        _guessYouLikeLabel.font = UIFont.fontSCM(16);
        CGFloat colorScale = 51.0/255.0;
        _guessYouLikeLabel.textColor = [UIColor colorWithRed:colorScale green:colorScale blue:colorScale alpha:1];
        _guessYouLikeLabel.text = @"给你推荐";
    }
    return _guessYouLikeLabel;
}

@end

