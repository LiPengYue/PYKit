//
//  PaySuccessGuessYouLikeCollectionView.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/11/26.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PaySuccessGuessYouLikeCollectionView.h"
#import "PYPaySuccessCuessYouLikeCollectionReusableView.h"
#import "PaySuccessGuessYouLikeCollectionViewCell.h"
#import <PYKitHeaders.h>
@interface PaySuccessGuessYouLikeCollectionView ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>

@property (nonatomic,strong) UICollectionView *collectionView;
@end

static NSString *const CELLID = @"PaySuccessGuessYouLikeCollectionViewCell";
static NSString *const HEADERID = @"PYPaySuccessCuessYouLikeCollectionReusableView";
@implementation PaySuccessGuessYouLikeCollectionView

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
}
// MARK: network


// MARK: handle views
- (void) setupView {
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.backgroundColor = UIColor.whiteColor;
    self.collectionView.backgroundColor = UIColor.whiteColor;
}

// MARK: handle event
- (void) registerEvents {
    
}

// MARK: properties get && set
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat itemSizeW = (w - 39)/2;
        CGFloat itemSizeH = itemSizeW * 210/168.0;
        layout.itemSize = CGSizeMake(itemSizeW, itemSizeH + 81);
        layout.minimumLineSpacing = 11;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 14, 0, 14);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[PaySuccessGuessYouLikeCollectionViewCell class] forCellWithReuseIdentifier:CELLID];
        [_collectionView registerClass:[PYPaySuccessCuessYouLikeCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEADERID];
    }
    return _collectionView;
}


// MARK:life cycles

// MARK: - delegate && datasource
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PaySuccessGuessYouLikeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELLID forIndexPath:indexPath];
    if ([cell isKindOfClass:[PaySuccessGuessYouLikeCollectionViewCell class]]) {
        
    }
    return cell;
}
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    PYPaySuccessCuessYouLikeCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEADERID forIndexPath:indexPath];
//    if ([view isKindOfClass:[PYPaySuccessCuessYouLikeCollectionReusableView class]]) {
//        if (indexPath.section == 0) {
//            view.title = @"猜你喜欢";
//        }
//    }
//    return view;
//}



@end
