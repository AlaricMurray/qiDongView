//
//  AppDelegate.m
//  启动图
//
//  Created by 朱明灿 on 17/2/16.
//  Copyright © 2017年 张佳强. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
@interface AppDelegate ()

@property (nonatomic , strong)UIImageView * imageView;
@property (nonatomic , assign)NSInteger i;
@property (nonatomic , strong)UILabel * label;
@property (nonatomic , strong)NSTimer * timer;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    [self setWindowRootVC];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[RootViewController alloc] init];
    [self.window makeKeyAndVisible];
    application.statusBarHidden = NO;
    

    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _imageView.image = [UIImage imageNamed:@"op"];
    
    [self.window addSubview:_imageView];
    
    _i = 3;
    _label = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-60, 50, 40, 30)];
    _label.text = @"3 s";
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:24];
    _label.textColor = [UIColor whiteColor];
    _label.backgroundColor = [UIColor clearColor];
    [_imageView addSubview:_label];
    
    
    
    [self.window bringSubviewToFront:_imageView];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(removeLun) userInfo:nil repeats:YES];
    
    return YES;
    

}
//
//- (void)setWindowRootVC
//{
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.rootViewController = [[RootViewController alloc] init];
//    [self.window makeKeyAndVisible];
//}


-(void)removeLun{
    
    _i--;
    _label.text = [NSString stringWithFormat:@"%li s",(long)_i];
    if (_i == 0) {
        [_label removeFromSuperview];
        [_imageView removeFromSuperview];
        [_timer invalidate];
        return;
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
