//
//  ICPlatformNameTableViewCell.m
//  Passwordmanager
//
//  Created by 朱封毅 on 21/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICPlatformNameTableViewCell.h"

@implementation ICPlatformNameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
