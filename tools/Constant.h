//
//  Constant.h
//  Passwordmanager
//
//  Created by 朱封毅 on 21/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#ifndef Constant_h
#define Constant_h


#define KMAIN_FONT(a) [UIFont fontWithName: @"Copperplate-Light" size:a]


/**
 *  设备屏幕的宽度
 */
#define DEVICE_SCREEN_WIDTH         ([[UIScreen mainScreen] bounds].size.width)


/**
 *  设备屏幕的高度
 */
#define DEVICE_SCREEN_HEIGHT        ([[UIScreen mainScreen] bounds].size.height)


/**
 *  设备默认的导航条高度
 */
#define DEVICE_NAVIGATIONBAR_HEIGHT 64.f

/**
 *  设备默认的tabBar高度
 */
#define DEVICE_TABBAR_HEIGHT 49.f

#define BLOCK_WEAK_SELF    __weak __typeof(self) weakSelf = self;



#define RGB(r, g, b) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:1]
//背景颜色
#define COLOR_MAINBACKGROUND RGB(248,248,248)
//一级标题颜色
#define COLOR_TITLE_ONE RGB(30, 30, 30)
//二级标题颜色
#define COLOR_TITLE_TWO RGB(80, 80, 80)


#define COLOR_TITLE_THREE RGB(160, 160, 160)



#endif /* Constant_h */
