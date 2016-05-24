//
//  KeyModel.h
//  Passwordmanager
//
//  Created by 朱封毅 on 20/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import <Foundation/Foundation.h>
//#define userPasswordKey @"userPasswordKey"
#define userPasswordKey  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

@interface KeyModel : NSObject

/**
 *  平台名
 */
@property(nonatomic,strong)NSString *platformName;


@property(nonatomic,strong)NSString *userName;
/**
 *  平台密码
 */
@property(nonatomic,strong)NSString *platformPassword;

/**
 *  logo 图片名
 */
@property(nonatomic,strong)UIImage *logoImage;


@end
