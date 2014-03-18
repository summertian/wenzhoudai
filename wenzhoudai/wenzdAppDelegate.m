//
//  wenzdAppDelegate.m
//  wenzhoudai
//
//  Created by 田瑞娇 on 14-3-17.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "wenzdAppDelegate.h"
//#import "helloViewController.h"
#import "ViewController.h"
#import "NextviewController.h"
@implementation wenzdAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
   
    
    // Override point for customization after application launch.
    //增加标识，用于判断是否是第一次启动应用...没有值或者是值为no都反回FALSe
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"helloLaunch"];
    }
    
    //在这里创建视图控制器，第一次进来进入试图控制器ViewController，第二次进来到NextViewController中
    //在视图控制器中加载视图
    
    //NSUserDefaults是个数据集，将一些key value存在本地的文件中，然后可以取
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        ViewController *appStartController = [[ViewController alloc] init];
       // appStartController.view.backgroundColor = [UIColor redColor];
        self.window.rootViewController = appStartController;
        [appStartController release];//生命周期，内存管理，生命周期是和应用程序绑定的
    }else {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"helloLaunch"];
        NextViewController *mainViewController = [[NextViewController alloc] init];
        mainViewController.view.backgroundColor = [UIColor blueColor];
        self.window.rootViewController=mainViewController;
        [mainViewController release];
    }
    
    //self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
