//
//  AppDelegate.m
//  aa
//
//  Created by 于海涛 on 17/3/9.
//  Copyright © 2017年 KennyHito. All rights reserved.
//

#import "AppDelegate.h"
#import "HeaderFile.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController * tabVC = [[UITabBarController alloc]init];
    
    firstViewController * firstVC = viewAlloc_(firstViewController);
    secondViewController * secondVC = viewAlloc_(secondViewController);
    thirdViewController * thirdVC = viewAlloc_(thirdViewController);
    NSArray * vcArr = @[firstVC,secondVC,thirdVC];
    NSArray * normalImageArr = @[@"shouye-1",@"zhuanxiang-1",@"wode-1"];
    NSArray * selectImageArr = @[@"shouye",@"zhuanxiang",@"wode"];
    NSMutableArray * totalArr= viewAlloc_(NSMutableArray);
    
    for (int i=0; i< vcArr.count; i++) {
        UIViewController * vc = vcArr[i];
        
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        
        UINavigationController * nav =[[UINavigationController alloc]initWithRootViewController:vc];
        
        //渲染模式
        UIImage * nomalImage = [[UIImage imageNamed:normalImageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                                 
        UIImage * selectedImage = [[UIImage imageNamed:selectImageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                                                             
        nav.tabBarItem.image = nomalImage;
        nav.tabBarItem.selectedImage = selectedImage;
        
        [totalArr addObject:nav];
    }
    
    tabVC.viewControllers = totalArr;
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];

    return YES;
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
