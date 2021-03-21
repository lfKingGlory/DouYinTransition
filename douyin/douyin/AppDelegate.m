//
//  AppDelegate.m
//  douyin
//
//  Created by msj on 2018/3/6.
//  Copyright © 2018年 mjsfax. All rights reserved.
//

#import "AppDelegate.h"
#import "MSNavigationController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// NSLog("testtest3test3test3test3test33");

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *v = [ViewController new];
    MSNavigationController *nav = [[MSNavigationController alloc] initWithRootViewController:v];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    NSLog("1234567");
    NSLog("fghjk");
    
    NSLog("testtest2test2test2test2t mmnnest2test22")

    
    return YES;
}



@end
