//
//  ICButtonTableViewCell.h
//  MyPassword
//
//  Created by 朱封毅 on 24/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ICButtonTableViewCellDelegate <NSObject>

-(void)buttonTableViewCellClick;

@end

@interface ICButtonTableViewCell : UITableViewCell

@property(nonatomic,weak) id <ICButtonTableViewCellDelegate> delegate;


@end
