//
//  ViewController.m
//  MyDemo
//
//  Created by jane-macPro on 2020/1/12.
//  Copyright © 2020 jane-macPro. All rights reserved.
//

#import "ViewController.h"

@interface TestView : UIView
@end

@implementation TestView

- (instancetype) init{
    self = [super init];
    if(self){
        
    }
    return self;
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
}
- (void)didMoveToWindow{
    [super didMoveToWindow];
    
}

@end

@interface ViewController()


@end

@implementation ViewController

- (instancetype)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}   // Called when the view is about to made visible. Default does nothing


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}    // Called when the view has been fully transitioned onto the screen. Default does nothing


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
} // Called when the view is dismissed, covered or otherwise hidden. Default does nothing


- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // Do any additional setup after loading the view.
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    view.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview:view];
    
    TestView *view2 = [[TestView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    view2.frame = CGRectMake(150, 150, 100, 100);
    [self.view addSubview:view2];
    
//    view 先入栈，view2 后入栈，view2显示在view上
    
}


@end
