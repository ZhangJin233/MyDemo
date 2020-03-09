//
//  ViewController.m
//  MyDemo
//
//  Created by jane-macPro on 2020/1/12.
//  Copyright © 2020 jane-macPro. All rights reserved.
//

#import "ViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteCellView.h"

@interface TestView : UIView
@end

//@implementation TestView
//
//- (instancetype) init{
//    self = [super init];
//    if(self){
//
//    }
//    return self;
//}
//
//- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
//    [super willMoveToSuperview:newSuperview];
//
//}
//- (void)didMoveToSuperview{
//    [super didMoveToSuperview];
//}
//- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
//    [super willMoveToWindow:newWindow];
//}
//- (void)didMoveToWindow{
//    [super didMoveToWindow];
//
//}
//
//@end

@interface ViewController()<UITableViewDataSource,UITableViewDelegate,GTNormalTableViewCellDelegate>
@property(nonatomic,strong,readwrite) UITableView *tableView;
@property(nonatomic,strong,readwrite) NSMutableArray *dataArray;


@end

@implementation ViewController

- (instancetype)init{
    self = [super init];
    if(self){
        _dataArray = @[].mutableCopy;
        for(int i = 0;i<20;i++){
            [_dataArray addObject:@(i)];
        }
    }
    return self;
}

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//}   // Called when the view is about to made visible. Default does nothing
//
//
//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//}    // Called when the view has been fully transitioned onto the screen. Default does nothing
//
//
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//} // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
//
//
//- (void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
//}  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing


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
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    
    [self.view addSubview:_tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GTDetailViewController *controller = [[GTDetailViewController alloc]init];
    controller.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    cell.backgroundColor = [UIColor whiteColor];
    if(!cell){
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    
    //    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    //    cell.textLabel.text = [NSString stringWithFormat:@"主标题 - %@",@(indexPath.row)];
    //    cell.detailTextLabel.text = @"副标题";
    //    cell.imageView.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    [cell layoutTableViewCell];
    
    return cell;
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton{
    GTDeleteCellView *deleteView = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
    
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    
    __weak typeof (self) wself = self;
    
    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
        __strong typeof(self)strongSelf = wself;
        [strongSelf.dataArray removeLastObject];
        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}


- (void)pushController{
    
    UIViewController *viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"内容";
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
