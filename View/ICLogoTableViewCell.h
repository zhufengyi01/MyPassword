//
//  ICLogoTableViewCell.h
//  Passwordmanager
//
//  Created by 朱封毅 on 21/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ICLogoTableViewCellDelegate <NSObject>

-(void)logoTableViewCellChooseImageButtonClick;


@end

@interface ICLogoTableViewCell : ICBaseTableViewCell


@property (weak, nonatomic) IBOutlet UIButton *logoBtn;

@property(nonatomic,weak)id <ICLogoTableViewCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;

@end
