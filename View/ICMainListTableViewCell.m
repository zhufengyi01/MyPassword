//
//  ICMainListTableViewCell.m
//  MyPassword
//
//  Created by 朱封毅 on 23/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICMainListTableViewCell.h"
#import "Masonry.h"

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


-(void)setModel:(KeyModel *)model{
    
    _model = model;
    UILabel *placeLable = nil;

    [self.logoImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if (!model.logoImage) {
        
        UIImage  *image = [UIImage imageWithColor:[UIColor orangeColor]];
        self.logoImageView.image = image;
        
        placeLable = [UILabel new];
        [self.logoImageView addSubview:placeLable];
        [placeLable mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.equalTo(self.logoImageView);
        }];
        placeLable.textColor = [UIColor whiteColor];
        placeLable.font = [UIFont systemFontOfSize:16];
        placeLable.text = model.platformName;
        placeLable.textAlignment = NSTextAlignmentCenter;
        
        
    }else{
    
        self.logoImageView.image = model.logoImage;
    }
    
    
    self.titleLbl.text = model.platformName;
    self.titleLbl.font = KMAIN_FONT(14);

}
@end
