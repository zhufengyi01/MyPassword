//
//  ICfingerPasswordViewController.m
//  MyPassword
//
//  Created by 朱封毅 on 24/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICfingerPasswordViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ICfingerPasswordViewController ()

@property (weak, nonatomic) IBOutlet UIButton *fingerPasswordBtn;

@property (weak, nonatomic) IBOutlet UILabel *fingerTipLbl;


@end

@implementation ICfingerPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fingerTipLbl.font =  KMAIN_FONT(14);
    self.fingerTipLbl.textColor = COLOR_TITLE_THREE;
    self.fingerPasswordBtn.tintColor = COLOR_TITLE_TWO;
    
    if ([[TouchIDManager sharedManager] canUseTouchId]) {

         [[TouchIDManager sharedManager] touchIDWithlocalizedFallbackTitle:@"" localizedReason:@"Please enter a fingerprint" success:^(BOOL success, NSError *error) {
         
             if (success) {
                 //指纹解锁登录密码成功
                 NSLog(@"指纹解锁登录密码成功 ====");
                 [self dismissViewControllerAnimated:YES completion:nil];
              
             }else{
                 
                 if (error.code == kLAErrorUserFallback) {
                     
                     
                 }
             }

         }];
        
    }

    [self.fingerPasswordBtn addTarget:self action:@selector(restartFingerPassword) forControlEvents:UIControlEventTouchUpInside];
}


-(void)restartFingerPassword
{
    if ([[TouchIDManager sharedManager] canUseTouchId]) {
        
        [[TouchIDManager sharedManager] touchIDWithlocalizedFallbackTitle:@"" localizedReason:@"Please enter a fingerprint" success:^(BOOL success, NSError *error) {
            
            if (success) {
                //指纹解锁登录密码成功
                NSLog(@"指纹解锁登录密码成功 ====");
                [self dismissViewControllerAnimated:YES completion:nil];
                
            }else{
                
                if (error.code == kLAErrorUserFallback) {
                    
                    
                }
            }
            
        }];
        
    }

    
}


@end
