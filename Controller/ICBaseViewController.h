//
//  ICBaseViewController.h
//  Passwordmanager
//
//  Created by 朱封毅 on 20/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ICBaseViewController : UITableViewController



@property(nonatomic,strong)NSMutableArray *dataSource;


/**
 *  默认的cell重用标示符
 */
@property (nonatomic, strong) NSString * defaultCellReuseIdentifier;

/**
 *  注册cell
 */
- (void)registerCellWithNibName:(NSString *)nibName reuseIdentifier:(NSString *)identifier;

- (void)registerCellWithClassName:(NSString *)className reuseIdentifier:(NSString *)identifier;
@end
