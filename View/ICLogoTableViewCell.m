//
//  ICLogoTableViewCell.m
//  Passwordmanager
//
//  Created by 朱封毅 on 21/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICLogoTableViewCell.h"

@interface ICLogoTableViewCell ()


@property (weak, nonatomic) IBOutlet UIButton *logoBtn;

@end



@implementation ICLogoTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.logoBtn.clipsToBounds = YES;
    self.logoBtn.layer.borderColor = COLOR_TITLE_TWO.CGColor;
    self.logoBtn.layer.borderWidth = 0.5;
}

- (IBAction)logoBtnClickEvent:(UIButton *)sender {
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
