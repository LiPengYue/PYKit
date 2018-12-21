//
//  PYBaseTableViewCell.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/12/4.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYBaseTableViewCell.h"
@interface PYBaseTableViewCell ()
@property (nonatomic,copy) void(^clickBaseCell)(PYBaseTableViewCell *cell);
@property (nonatomic,strong) UIButton *baseCellBackground_Button;
@end
@implementation PYBaseTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self baseCell_setupViews];
    }
    return self;
}
- (void) baseCell_setupViews {
    self.baseCellBackground_Button = [UIButton new];
    [self addSubview: self.baseCellBackground_Button];
    [self.baseCellBackground_Button addTarget:self action:@selector(click_baseCellBackground_Button) forControlEvents:UIControlEventTouchUpInside];

}

- (void) click_baseCellBackground_Button {
    if (self.clickBaseCell){
        __weak typeof(self)weakSelf = self;
        self.clickBaseCell(weakSelf);
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.baseCellBackground_Button.frame = self.bounds;
}
- (void) clickBaseCellFunc:(void(^)(PYBaseTableViewCell *cell))block {
    self.clickBaseCell = block;
}
- (void)dealloc
{
    NSLog(@"%@ ✅ 销毁",NSStringFromClass([self class]));
}
@end
