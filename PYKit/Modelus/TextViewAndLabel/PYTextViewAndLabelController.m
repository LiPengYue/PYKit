//
//  PYTextViewAndLabelController.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/10/15.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYTextViewAndLabelController.h"
#import <PYKit/PYKitHeaders.h>
@interface PYTextViewAndLabelController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray <NSString *>*dataArray;
@end

NSString *const CELLID = @"CELLID";
@implementation PYTextViewAndLabelController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self py_setUp];
}
#pragma mark - init

#pragma mark - functions

- (void) py_setUp {
    [self.view addSubview:self.tableView];
    [self loadData];
}

// MARK: network
- (void) loadData {
    self.dataArray = @[@"PYStringSizeVC",@"PYStringSizeViewController"];
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
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLID];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}


//MARK: - UITableViewDataSource && UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *vcName = self.dataArray[indexPath.row];
    PYBaseViewController *vc = [NSClassFromString(vcName) new];
    if ([vc isKindOfClass:[UIViewController class]]) {
        vc.title = vcName;
        [self.navigationController pushViewController:vc animated:true];
    }
}

@end

