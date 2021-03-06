//
//  ICBaseViewController.m
//  Passwordmanager
//
//  Created by 朱封毅 on 20/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICBaseViewController.h"

@interface ICBaseViewController ()

@end

@implementation ICBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataSource =  [NSMutableArray array];

    self.view.backgroundColor =COLOR_MAINBACKGROUND;
    [self.tableView setTableFooterView:[UIView new]];
    
}


#pragma mark 通过nib文件名称注册cell
- (void)registerCellWithNibName:(NSString *)nibName reuseIdentifier:(NSString *)identifier {
    
    UINib * nib = [UINib nibWithNibName:nibName bundle:nil];
    
    if (!nib) {
        return;
    }
    
    self.defaultCellReuseIdentifier = identifier;
    [self.tableView registerNib:nib forCellReuseIdentifier:identifier];
}


#pragma mark 通过类名注册cell
- (void)registerCellWithClassName:(NSString *)className reuseIdentifier:(NSString *)identifier {
    
    Class class = NSClassFromString(className);
    
    if (!class) {
        return;
    }
    
    self.defaultCellReuseIdentifier = identifier;
    [self.tableView registerClass:class forCellReuseIdentifier:identifier];
}



#pragma TableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

@end
