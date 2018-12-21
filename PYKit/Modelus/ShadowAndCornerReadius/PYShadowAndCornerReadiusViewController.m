//
//  PYShadowAndCornerReadiusViewController.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/14.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYShadowAndCornerReadiusViewController.h"
#import "PYMaskToBoundsTableView.h"
#import "PYRoundViewTableView.h"
#import <PYKitHeaders.h>
#import "PYLayoutSudokuViewHandler.h"


@interface PYShadowAndCornerReadiusViewController ()

@property (nonatomic,strong) PYRoundViewTableView *tableView1;
@property (nonatomic,strong) PYMaskToBoundsTableView *tableView2;
@end

static NSInteger const count = 2000;

@implementation PYShadowAndCornerReadiusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 圆角工具样式
    [self showFillet];
    
    /// 开启系统与优化后工具性能对比视图
//    [self setuptest];
}

- (void) setuptest {
    [self setupView];
    [self setupNav];
    [self registerEvent];
}
- (void) showFillet {
    UIScrollView *scrollView = [UIScrollView new];
    self.view.addSubView(scrollView);
    
    scrollView.frame = self.view.bounds;
    
    
    for(int i = 0; i < 6; i++) {
        BaseFilletShadowView *view = [BaseFilletShadowView new];
        [scrollView addSubview:view];
        
        switch (i) {
            case 0:
                view
                .config
                .setUpRadius(10);
                break;
            case 1:
                view
                .config
                .setUpRadius(10)
                .setUpLeftTopAddRadius(10);
                break;
            case 2:
                view
                 .config
                 .setUpLeftTopAddRadius(30);
                break;

            case 3:
                view
                .config
                .setUpLeftBottomAddRadius(30);
                break;
            case 4:
                view
                .config
                .setUpRightTopAddRadius(30);
                break;

            case 5:
                view
                .config
                .setUpRightBottomAddRadius(30);
                break;
            default:
                break;
        }
        [self silletShadowViewAddImage:view];
        view.containerView.backgroundColor = UIColor.redColor;
    }
    CGFloat w = self.view.bounds.size.width;
    w = (w - 50) / 3;
    [PYLayoutSudokuViewHandler
    .create()
    .setUpFixedItemSpacing(CGSizeMake(10, 10))
    .setUpWarpCount(3)
    .setUpFixedItemSize(CGSizeMake(w, w))
    .setUpSudokuViewEdges(UIEdgeInsetsMake(15, 15, 15, 15))
    layoutSudokuViewWithViews:scrollView.subviews];
    
    
}

- (void) silletShadowViewAddImage: (BaseFilletShadowView *)view {
    UIImageView *imageView = [UIImageView new];
    [view.containerView addSubview:imageView];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = [UIImage imageNamed:@"1"];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view.containerView);
    }];
}
- (void) setupView {
    [self.view addSubview:self.tableView1];
    [self.view addSubview: self.tableView2];
}

- (void) setupNav {
    UIButton *button = [UIButton new];
    [button addTarget:self action:@selector(clickRight) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"😝" forState:UIControlStateNormal];
    button.backgroundColor = UIColor.redColor;
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = right;
}

- (void) registerEvent {
    __weak typeof(self)weakSelf = self;
    [NSObject receivedWithSender:self.tableView1 andSignal:^id(NSString *key, id message) {
        weakSelf.tableView2.contentOffset =weakSelf.tableView1.contentOffset;
        return nil;
    }];
}

- (void) clickRight {
    [self.tableView1 setContentOffset: CGPointMake(0, self.tableView1.contentSize.height) animated:true];
    [self.tableView2 setContentOffset: CGPointMake(0, self.tableView2.contentSize.height) animated:true];
}

- (PYMaskToBoundsTableView *)tableView2 {
    if (!_tableView2) {
        CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width/2.0, self.view.bounds.size.height);
        _tableView2 = [[PYMaskToBoundsTableView alloc]initWithFrame:rect style:UITableViewStylePlain];
        _tableView2.count = count;
    }
    return _tableView2;
}

- (PYRoundViewTableView *)tableView1 {
    if (!_tableView1) {
        CGRect rect = CGRectMake(self.view.bounds.size.width/2.0, 0, self.view.bounds.size.width/2.0, self.view.bounds.size.height);
        _tableView1 = [[PYRoundViewTableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    
        _tableView1.count = count;
        
    }
    return _tableView1;
}

@end
