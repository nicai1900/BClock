//
//  AppDelegate.m
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "CenterClockViewController.h"


@implementation AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    LeftViewController * leftDrawer = [[LeftViewController alloc] init];
    leftDrawer.view.backgroundColor = [UIColor blackColor];
    
    CenterClockViewController * center = [[CenterClockViewController alloc] init];
    
    UIViewController * rightDrawer = [[RightViewController alloc] init];
    rightDrawer.view.backgroundColor = [UIColor greenColor];
    
    MMDrawerController * drawerController = [[MMDrawerController alloc]
                                             initWithCenterViewController:center
                                             leftDrawerViewController:leftDrawer
                                             rightDrawerViewController:rightDrawer];
    
    [drawerController setMaximumRightDrawerWidth:200];
    [drawerController setMaximumLeftDrawerWidth:200];
    
    [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
     _window.rootViewController = drawerController;
    [_window makeKeyAndVisible];
    return YES;

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end