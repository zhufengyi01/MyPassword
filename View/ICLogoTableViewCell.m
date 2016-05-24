//
//  ICLogoTableViewCell.m
//  Passwordmanager
//
//  Created by 朱封毅 on 21/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICLogoTableViewCell.h"

@interface ICLogoTableViewCell ()


@end



@implementation ICLogoTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.logoImageView.layer.cornerRadius = 6;
    self.logoImageView.clipsToBounds = YES;

}


- (IBAction)logoBtnClickEvent:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(logoTableViewCellChooseImageButtonClick)]) {
        
        [self.delegate logoTableViewCellChooseImageButtonClick];
    }
    
}

@end
