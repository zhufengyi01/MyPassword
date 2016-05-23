//
//  ICDetailViewController.m
//  Passwordmanager
//
//  Created by 朱封毅 on 20/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICDetailViewController.h"

@interface ICDetailViewController ()
/**
 *  右侧编辑按钮
 */
@property(nonatomic,strong)  UIBarButtonItem *rightBarItem;


@end

@implementation ICDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self createNavigation];
}


-(void)createNavigation
{
    self.navigationItem.title = @"Password Detail";

    
    self.rightBarItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(rightNavigationHandle)];
    self.rightBarItem.tintColor = COLOR_TITLE_ONE;
    self.navigationItem.rightBarButtonItem = self.rightBarItem;
}

/*
-(void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}*/
-(void)rightNavigationHandle
{
    
    
}



@end
