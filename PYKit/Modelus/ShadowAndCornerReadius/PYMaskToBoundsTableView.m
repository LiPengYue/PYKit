//
//  PYMaskToBoundsTableView.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/15.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYMaskToBoundsTableView.h"

#import "PYShadowAndCornerReadiusTableViewCell.h"

@interface PYMaskToBoundsTableView ()
<UITableViewDelegate,
UITableViewDataSource>

@end



static NSString *const CellId = @"PYShadowAndCornerReadiusTableViewCellID";

@implementation PYMaskToBoundsTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self setup];
    }
    return self;
}
- (void) setup {
    [self registerClass:[PYShadowAndCornerReadiusTableViewCell class] forCellReuseIdentifier:CellId];
    self.dataSource = self;
    self.delegate = self;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.count;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PYShadowAndCornerReadiusTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellId forIndexPath:indexPath];
    cell.indexLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    cell.isShow_roundCornerView = false;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CGFloat baseH = MAX(indexPath.row + 1, 40);
    return MIN(self.frame.size.width, baseH);
}

@end
