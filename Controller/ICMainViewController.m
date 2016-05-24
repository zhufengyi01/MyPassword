//
//  ICMainViewController.m
//  Passwordmanager
//
//  Created by 朱封毅 on 20/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICMainViewController.h"
#import "KeyModel.h"
#import "ICDetailViewController.h"
#import "ICFullScreenAnd3DNavigation.h"
#import "ICAddPasswordViewController.h"

@interface ICMainViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
}

@end


@implementation ICMainViewController

#pragma mark LifeCyle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self createNavigation];
    

    [self registerCellWithNibName:@"ICMainListTableViewCell"  reuseIdentifier:@"ICMainListTableViewCell"];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    if ([self.navigationController isKindOfClass:[ICFullScreenAnd3DNavigation class]]) {
        [(ICFullScreenAnd3DNavigation *)self.navigationController setDragBackEnable:NO];
    }
    [self getUserPasswordDataSource];

}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    if ([self.navigationController isKindOfClass:[ICFullScreenAnd3DNavigation class]]) {
        [(ICFullScreenAnd3DNavigation *)self.navigationController setDragBackEnable:YES];
    }
    
}

#pragma mark Setter Method



#pragma mark Getter Method
#pragma mark Privite Method

-(void)createNavigation
{
    self.navigationItem.title = @"Password list";

    UIBarButtonItem *barItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightNavigationHandle)];
    barItem.tintColor = COLOR_TITLE_ONE;
    self.navigationItem.rightBarButtonItem = barItem;
    
    
    UIButton *backbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backbtn.frame = CGRectMake(0, 0, 40, 40);
    [backbtn setImage:[UIImage imageNamed:@"nav_return"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    backbtn.contentMode = UIViewContentModeLeft;
    self.navigationController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backbtn];
    
}

-(void)rightNavigationHandle
{

    ICFullScreenAnd3DNavigation *na = [[ICFullScreenAnd3DNavigation alloc] initWithRootViewController:[ICAddPasswordViewController new]];
    [self presentViewController:na  animated:YES completion:nil];
    
}

#pragma mark 数据获取
-(void)getUserPasswordDataSource
{
    NSString *keyPath = [userPasswordKey stringByAppendingPathComponent:@"userKey"];

    NSArray *keyList = [NSKeyedUnarchiver unarchiveObjectWithFile:keyPath];
    
    self.dataSource  = [NSMutableArray arrayWithArray:keyList];

    [self.tableView reloadData];
}


#pragma mark Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ICMainListTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"ICMainListTableViewCell"];
    KeyModel *model  = [self.dataSource objectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    KeyModel *model  = [self.dataSource objectAtIndex:indexPath.row];
    
    ICDetailViewController *vc=  [ICDetailViewController new];
    vc.model = model;
    vc.index = indexPath.row;
    [self.navigationController pushViewController:vc  animated:YES];

}


#pragma mark Notification



@end
