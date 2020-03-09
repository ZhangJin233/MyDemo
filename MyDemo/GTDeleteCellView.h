//
//  GTDeleteCellView.h
//  MyDemo
//
//  Created by jane-macPro on 2020/3/9.
//  Copyright © 2020 jane-macPro. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView

- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock;

@end

NS_ASSUME_NONNULL_END
