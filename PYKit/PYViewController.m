//
//  PYViewController.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/10/10.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYViewController.h"
#import "PYBaseNavigationBarView.h"
#import <PYKitHeaders.h>
#import "PYBaseTableViewCell.h"
static NSString *const CELLID = @"CELID";

@interface PYViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
CAAnimationDelegate
>
@property (nonatomic,strong) PYBaseNavigationBarView *naviBarView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray <NSString *>*dataArray;
@property (nonatomic,strong) UIButton *animationView;
@property (nonatomic,strong) CALayer *shadowLayer;
//@property (nonatomic,strong) PYInvocation *invocation;
@property (nonatomic,assign) CGColorRef color;
@end

@implementation PYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self py_setUpNav];
    [self py_setUp];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.naviBarView.shadowConfig
     py_setUpWeakSelfFunc:^(ViewShadowConfigration *weakConfig) {
         
         weakConfig
         .py_setUpFromShadowOpacity(1)
         .py_setUpFromShadowColor(UIColor.redColor)
         .py_setUpFromShadowOffset(CGSizeMake(-10, -10))
         .py_setUpToShadowColor(UIColor.blueColor)
         .py_setUpToShadowOffset(CGSizeMake(10, 10))
         .py_setUpToShadowOpacity(1);
         
         [weakConfig py_setUpAndBiginAnimations:
          ^(CABasicAnimation *colorAnimation,
            CABasicAnimation *offsetAnimation,
            CABasicAnimation *opacityAnimation,
            CABasicAnimation *radiusAnimation,
            CAAnimationGroup *groupAnimation){
              groupAnimation.duration = 4;
         }];
     }];
}

- (void) py_setUpNav {
    self.naviBarView = [PYBaseNavigationBarView new];
    [self.naviBarView
     py_setUpWeakSelfFunc:^(PYBaseNavigationBarView *weak) {
        weak
        .addLeftItemWithTitleAndImg(@"👈👈",nil)
        .addRightItemWithTitleAndImg(@"👉👉",nil)
        .addTitleItemWithTitleAndImg(@"中",nil);
    }];
    
    [self.naviBarView
     clickTitleButtonFunc:^(UIButton *button) {
        NSLog(@"✅");
    }];
    
    [self.naviBarView
     clickLeftButtonFunc:^(UIButton *button, NSInteger index) {
        NSLog(@"👈");
    }];
    
    [self.naviBarView
     clickRightButtonFunc:^(UIButton *button, NSInteger index) {
        NSLog(@"👉");
    }];
    
    [self.view addSubview:self.naviBarView];
    
    self.naviBarView.frame = CGRectMake(100, 100, KWIDTH-20, 200);
    
    [self.naviBarView reloadView];
    
    self.naviBarView
    .py_setUpBackgroundColor(UIColor.grayColor)
    .py_setUpBorderColor(UIColor.redColor)
    .py_setUpBorderWidth(1);
    return ;
    
}

- (void)click_buttonButton {
    
}
#pragma mark - init

#pragma mark - functions

- (void) py_setUp {
    [self.view addSubview:self.tableView];
    [self loadData];
}

// MARK: network
- (void) loadData {
    self.dataArray = @[
                       @"PYFoldButtonsViewController",
                       @"PYTextViewAndLabelController",
                       @"PYShadowAndCornerReadiusViewController",
                       @"PYMethodParserViewController",
                       @"PaySuccessViewController",
                       @"PYTransitionAnimaterViewController",
                       @"PYGradientViewController"
                       ];
}

// MARK: handle views

// MARK: handle event

// MARK: properties get && set

// MARK:life cycles
- (UITableView *)tableView {
    if (!_tableView) {
        CGRect rect = self.view.bounds;
        rect.origin.y += 70;
        rect.size.height -= rect.origin.y;
        _tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
        [_tableView registerClass:[PYBaseTableViewCell class] forCellReuseIdentifier:CELLID];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

//MARK: - UITableViewDataSource && UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PYBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.selectionStyle = UIAccessibilityTraitNone;
    
    if ([cell isKindOfClass:[PYBaseTableViewCell class]]) {
        __weak typeof (self)weakself = self;
        
        __weak typeof(tableView) weakTab = tableView;
        [cell clickBaseCellFunc:^(PYBaseTableViewCell *cell) {
            
            [weakself didSelectRowAtIndex:[weakTab indexPathForCell:cell]];
        }];
    }
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (void) didSelectRowAtIndex: (NSIndexPath *)indexPath {
    NSString *vcName = self.dataArray[indexPath.row];
    PYViewController *vc = [NSClassFromString(vcName) new];
    if ([vc isKindOfClass:[UIViewController class]]) {
        vc.title = vcName;
        if ([vc isKindOfClass:NSClassFromString(@"BasePresentViewController")]) {
            [self presentViewController:vc animated:true completion:nil];
            return;
        }
        //        [self presentViewController:vc animated:true  completion:nil];
        [self.navigationController pushViewController:vc animated:true];
    }
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *vcName = self.dataArray[indexPath.row];
    PYViewController *vc = [NSClassFromString(vcName) new];
    if ([vc isKindOfClass:[UIViewController class]]) {
        vc.title = vcName;
        if ([vc isKindOfClass:NSClassFromString(@"BasePresentViewController")]) {
            [self presentViewController:vc animated:true completion:nil];
            return;
        }
//        [self presentViewController:vc animated:true  completion:nil];
        [self.navigationController pushViewController:vc animated:true];
    }
}
- (void)didReceiveMemoryWarning {
    //即使没有显示在window上，也不会自动的将self.view释放。注意跟ios6.0之前的区分
    [super didReceiveMemoryWarning];
    // 此处做兼容处理需要加上ios6.0的宏开关，保证是在6.0下使用的,6.0以前屏蔽以下代码，否则会在下面使用self.view时自动加载viewDidUnLoad
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0) {
        //需要注意的是self.isViewLoaded是必不可少的，其他方式访问视图会导致它加载，在WWDC视频也忽视这一点。
        if (self.isViewLoaded && !self.view.window)// 是否是正在使用的视图
        {
            // Add code to preserve data stored in the views that might be
            
            // 目的是再次进入时能够重新加载调用viewDidLoad函数。
            self.view = nil;
        }
    }
}


@end
