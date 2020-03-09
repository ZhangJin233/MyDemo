//
//  GTNormalTableViewCell.h
//  MyDemo
//
//  Created by jane-macPro on 2020/3/8.
//  Copyright © 2020 jane-macPro. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTNormalTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface GTNormalTableViewCell : UITableViewCell

@property(nonatomic,weak,readwrite) id<GTNormalTableViewCellDelegate> delegate;

- (void)layoutTableViewCell;
@end

NS_ASSUME_NONNULL_END
