//
//  ICInputTableViewCell.h
//  MyPassword
//
//  Created by 朱封毅 on 23/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,ICInputTableViewCellType) {
  
    ICInputTableViewCellTypePlatform,
    ICInputTableViewCellTypePassword,
};

@interface ICInputTableViewCell : ICBaseTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@end
