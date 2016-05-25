//
//  AppDelegate.m
//  MyPassword
//
//  Created by 朱封毅 on 23/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "AppDelegate.h"
#import "ICMainViewController.h"
#import "ICFullScreenAnd3DNavigation.h"

@interface AppDelegate ()
{
    BOOL didEnterBackground;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // ICFullScreenAnd3DNavigation
    ICFullScreenAnd3DNavigation *na = [[ICFullScreenAnd3DNavigation alloc] initWithRootViewController:[ICMainViewController new]];
    self.window.rootViewController  =na;
    
    return YES;
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    didEnterBackground = YES;
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    [[NSUserDefaults standardUserDefaults] setDouble:timeInterval forKey:@"applicationDidEnterBackgroundTime"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    if (didEnterBackground) {
        
        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
        
        double currentTimeInterval = [[NSUserDefaults standardUserDefaults] doubleForKey:@"applicationDidEnterBackgroundTime"];
        
        // 大于30分钟超时
        if (timeInterval - currentTimeInterval > 10   ) {
            
            // 重新加载手势密码
            [self.window.rootViewController presentViewController:[ICfingerPasswordViewController new ] animated:YES completion:nil];
        }
    }
    didEnterBackground = NO;
    
}


@end
