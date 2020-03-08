//
//  GTNormalTableViewCell.m
//  MyDemo
//
//  Created by jane-macPro on 2020/3/8.
//  Copyright © 2020 jane-macPro. All rights reserved.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell ()

@property(nonatomic,strong,readwrite) UILabel *titleLable;
@property(nonatomic,strong,readwrite) UILabel *sourceLable;
@property(nonatomic,strong,readwrite) UILabel *commentLable;
@property(nonatomic,strong,readwrite) UILabel *timeLable;
@property(nonatomic,strong,readwrite) UIImageView *rightImageView;


@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:({
            self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
            //            self.titleLable.backgroundColor = [UIColor redColor];
            self.titleLable.font = [UIFont systemFontOfSize:16];
            self.titleLable.textColor = [UIColor blackColor];
            self.titleLable;
        })];
        
        [self.contentView addSubview:({
            self.sourceLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
            //            self.sourceLable.backgroundColor = [UIColor redColor];
            self.sourceLable.font = [UIFont systemFontOfSize:12];
            self.sourceLable.textColor = [UIColor grayColor];
            self.sourceLable;
        })];
        
        [self.contentView addSubview:({
            self.commentLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
            //            self.commentLable.backgroundColor = [UIColor redColor];
            self.commentLable.font = [UIFont systemFontOfSize:12];
            self.commentLable.textColor = [UIColor grayColor];
            self.commentLable;
        })];
        
        [self.contentView addSubview:({
            self.timeLable = [[UILabel alloc] initWithFrame:CGRectMake(150, 80, 50, 20)];
            //            self.timeLable.backgroundColor = [UIColor redColor];
            self.timeLable.font = [UIFont systemFontOfSize:12];
            self.timeLable.textColor = [UIColor grayColor];
            self.timeLable;
        })];
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(280, 15, 70, 70)];
            self.rightImageView.backgroundColor = [UIColor redColor];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFill;
            self.rightImageView;
        })];
    }
    return self;
}

- (void)layoutTableViewCell{
    self.titleLable.text = @"极客时间iOS开发";
    
    self.sourceLable.text = @"极客时间";
    [self.sourceLable sizeToFit];
    
    self.commentLable.text = @"1666评论";
    [self.commentLable sizeToFit];
    self.commentLable.frame = CGRectMake(self.sourceLable.frame.origin.x + self.sourceLable.frame.size.width + 15, self.commentLable.frame.origin.y, self.commentLable.frame.size.width, self.commentLable.frame.size.height);
    
    self.timeLable.text = @"三分钟前";
    [self.timeLable sizeToFit];
    self.timeLable.frame = CGRectMake(self.commentLable.frame.origin.x + self.commentLable.frame.size.width + 15, self.timeLable.frame.origin.y, self.timeLable.frame.size.width, self.timeLable.frame.size.height);
    
    self.rightImageView.image = [UIImage imageNamed:@"icon.bundle/timg.JPG"];
}

@end
