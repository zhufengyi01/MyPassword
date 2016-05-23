//
//  ICMainListTableViewCell.m
//  MyPassword
//
//  Created by 朱封毅 on 23/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICMainListTableViewCell.h"

@interface ICMainListTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@end



@implementation ICMainListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
