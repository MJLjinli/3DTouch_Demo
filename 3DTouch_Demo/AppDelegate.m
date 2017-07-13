//
//  AppDelegate.m
//  3DTouch_Demo
//
//  Created by 马金丽 on 17/7/13.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTabBarViewController.h"

@interface AppDelegate ()
@property(nonatomic,strong)RootTabBarViewController *rootVC;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
   _rootVC = [[RootTabBarViewController alloc]init];

    self.window.rootViewController = _rootVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

//动态添加ShortcutItem
- (void)dynamicAddShortcutItem
{
   
    UIApplicationShortcutIcon *collectionShortIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove];
    UIApplicationShortcutItem *collectionShortItem = [[UIApplicationShortcutItem alloc]initWithType:@"mycollection" localizedTitle:@"我的收藏" localizedSubtitle:nil icon:collectionShortIcon userInfo:nil];
    [UIApplication sharedApplication].shortcutItems = @[collectionShortItem];
}
//3dToch快捷键的回调
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    if ([shortcutItem.type isEqualToString:@"mycollection"]) {
        NSLog(@"我的收藏");
        _rootVC.selectedIndex = 0;
    }else if ([shortcutItem.type isEqualToString:@"myCenter"]){
        NSLog(@"我的");
        _rootVC.selectedIndex = 1;
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
