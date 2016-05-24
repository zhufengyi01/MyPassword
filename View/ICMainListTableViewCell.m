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
    self.logoImageView.layer.cornerRadius = 4;
    self.logoImageView.clipsToBounds = YES;
}


-(void)setModel:(KeyModel *)model
{
    _model = model;
    
    self.logoImageView.image = model.logoImage;
    self.titleLbl.text = model.platformName;
    self.titleLbl.font = KMAIN_FONT(14);

}
@end
