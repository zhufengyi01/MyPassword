//
//  ICAddPasswordViewController.m
//  Passwordmanager
//
//  Created by 朱封毅 on 20/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICAddPasswordViewController.h"

@interface ICAddPasswordViewController ()

@property(nonatomic,strong) ICLogoTableViewCell *logoCell;



@end

@implementation ICAddPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createNavigation];

}


#pragma mark Getter Megthod

-(ICLogoTableViewCell *)logoCell{
    if (!_logoCell) {
        
        [self registerCellWithNibName:NSStringFromClass([ICLogoTableViewCell class]) reuseIdentifier:NSStringFromClass([ICLogoTableViewCell class])];
        _logoCell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ICLogoTableViewCell class])];
    }
    return _logoCell;
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


#pragma mark Delegate 

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    if (indexPath.row==0) {
        
        return self.logoCell;
    }
    return [UITableViewCell new];
}






@end
