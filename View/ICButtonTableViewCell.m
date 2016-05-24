//
//  ICButtonTableViewCell.m
//  MyPassword
//
//  Created by 朱封毅 on 24/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICButtonTableViewCell.h"

@interface ICButtonTableViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *comformBtn;

@end


@implementation ICButtonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.comformBtn.layer.cornerRadius = 4;
    self.comformBtn.clipsToBounds = YES;
    
    [self.comformBtn addTarget:self action:@selector(comfromEvent) forControlEvents:UIControlEventTouchUpInside];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.comformBtn setBackgroundImage:[UIImage imageWithColor:COLOR_RED] forState:UIControlStateNormal];
    [self.comformBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.comformBtn.titleLabel.font  =KMAIN_FONT(15);
}

-(void)comfromEvent
{
    
    if (self.delegate  && [self.delegate respondsToSelector:@selector(buttonTableViewCellClick)]) {
        
        [self.delegate buttonTableViewCellClick];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
