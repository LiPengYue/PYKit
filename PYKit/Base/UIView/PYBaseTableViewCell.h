//
//  PYBaseTableViewCell.h
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/12/4.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PYBaseTableViewCell : UITableViewCell
- (void) clickBaseCellFunc:(void(^)(PYBaseTableViewCell *cell))block;
@end
