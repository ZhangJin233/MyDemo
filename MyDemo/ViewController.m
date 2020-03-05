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

@interface ViewController()<UITableViewDataSource,UITableViewDelegate>


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
    
    //    TestView *view2 = [[TestView alloc] init];
    //    view2.backgroundColor = [UIColor greenColor];
    //    view2.frame = CGRectMake(150, 150, 100, 100);
    //    [self.view addSubview:view2];
    //
    //    //    view 先入栈，view2 后入栈，view2显示在view上
    //
    //
    //    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    //    [view2 addGestureRecognizer:tapGesture];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    
    tableView.delegate = self;
    
    
    [self.view addSubview:tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *controller = [[UIViewController alloc]init];
    controller.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    
    //    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    cell.textLabel.text = [NSString stringWithFormat:@"主标题 - %@",@(indexPath.row)];
    cell.detailTextLabel.text = @"副标题";
    cell.imageView.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    return cell;
}


- (void)pushController{
    
    UIViewController *viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"内容";
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
