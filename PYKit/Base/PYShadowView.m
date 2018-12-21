//
//  PYShadowView.m
//  PYKit_Example
//
//  Created by 李鹏跃 on 2018/10/30.
//  Copyright © 2018年 LiPengYue. All rights reserved.
//

#import "PYShadowView.h"

@interface PYShadowView ()
@property (nonatomic,assign) BOOL isFirstLayout;

@end

@implementation PYShadowView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self py_setUp];
        self.originFrame = CGRectZero;
        self.isFirstLayout = true;
    }
    return self;
}
- (void) py_setUp {
    [self addObserver:self forKeyPath:@"frame"
              options:
     NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
              context:nil];

}

- (void) observeValueForKeyPath:(NSString *)keyPath
                       ofObject:(id)object
                         change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                        context:(void *)context {
    if([keyPath isEqualToString:@"frame"]) {
        
       NSNumber *frameNumbNew = (NSNumber*)change[NSKeyValueChangeNewKey];
        NSNumber *frameNumbOld = (NSNumber*)change[NSKeyValueChangeOldKey];

        CGRect frameNew = frameNumbNew.CGRectValue;
        CGFloat centerNewX = CGRectGetMidX(frameNew);
        CGFloat centerNewY = CGRectGetMidY(frameNew);
        
        CGRect frameOld = frameNumbOld.CGRectValue;
        CGFloat centerOldX = CGRectGetMidX(frameOld);
        CGFloat centerOldY = CGRectGetMidY(frameOld);
        
        CGFloat x = self.shadowOffset.x;
        CGFloat y = self.shadowOffset.y;
        
        x = x + centerNewX - centerOldX;
        y = y + centerNewY - centerOldY;
        
        self.shadowOffset = CGPointMake(x, y);
        
        self.layer.shadowOffset = CGSizeMake(x, y);
    }
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"frame"];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.isFirstLayout) {
        self.isFirstLayout = false;
        if (CGRectEqualToRect(self.originFrame, CGRectZero)) {
            self.originFrame = self.frame;
        }
    }
}
@end
