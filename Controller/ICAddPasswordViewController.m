//
//  ICAddPasswordViewController.m
//  Passwordmanager
//
//  Created by 朱封毅 on 20/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICAddPasswordViewController.h"

@interface ICAddPasswordViewController ()


@end

@implementation ICAddPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createNavigation];

}

#pragma mark Privite Method
-(void)createNavigation
{
    self.navigationItem.title = @"add Password";
    
    UIBarButtonItem *barItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightNavigationHandle)];
    barItem.tintColor = COLOR_TITLE_ONE;
    self.navigationItem.rightBarButtonItem = barItem;
}

-(void)rightNavigationHandle
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
