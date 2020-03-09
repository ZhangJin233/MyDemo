//
//  GTDeleteCellView.m
//  MyDemo
//
//  Created by jane-macPro on 2020/3/9.
//  Copyright © 2020 jane-macPro. All rights reserved.
//

#import "GTDeleteCellView.h"

@interface GTDeleteCellView ()

@property(nonatomic,strong,readwrite)UIView *backgroudView;
@property(nonatomic,strong,readwrite)UIButton *deleteButton;
@property(nonatomic,copy,readwrite)dispatch_block_t deleteBlock;


@end
@implementation GTDeleteCellView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:({
            _backgroudView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroudView.backgroundColor = [UIColor blackColor];
            _backgroudView.alpha = 0.5;
            [_backgroudView addGestureRecognizer:({
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
                tapGesture;
            })];
            _backgroudView;
        })];
        
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
    }
    return self;
}

- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock{
    _deleteButton.frame  = CGRectMake(point.x, point.y, 0, 0);
    
    _deleteBlock = [clickBlock copy];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
    } completion:^(BOOL finished){
        NSLog(@"");
    }];
}

- (void)dismissDeleteView{
    [self removeFromSuperview];
    
}

-(void)_clickButton{
    if(_deleteBlock){
        _deleteBlock();
    }
    [self removeFromSuperview];
}

@end
