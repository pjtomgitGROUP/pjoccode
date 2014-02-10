//
//  PJAppDelegate.m
//  新浪微博
//
//  Created by ki_tom on 14-1-17.
//  Copyright (c) 2014年 ki_tom. All rights reserved.
//

#import "PJAppDelegate.h"
#import "NewFeatureController.h"
@implementation PJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    //检测是否第一次使用该版本
    
    id key = (id)kCFBundleVersionKey;
    //软件的版本信息
    NSDictionary *info = [NSBundle mainBundle].infoDictionary ;
    //获取当前软件的版本号
    NSString *currentversion =[[info objectForKey:key]autorelease];
    
    //从沙盒中取出上次记录的版本号
    NSUserDefaults *userDefaults =[NSUserDefaults standardUserDefaults];
    NSString *oldVersion = [[userDefaults objectForKey:key]autorelease];
   
    
    //已经使用过该版本
    if ([currentversion isEqualToString:oldVersion]) {
        PJLog(@"已经使用过");
    }else{
        //更新沙盒中的版本号
        [userDefaults setObject:currentversion forKey:key];
        //立刻同步到沙河，否则会延迟保存
        [userDefaults synchronize];
        PJLog(@"第一次使用该版本");
        //加载应用新特新
          }
    NewFeatureController *newFeature = [[[NewFeatureController alloc ]init]autorelease];
    self.window.rootViewController = newFeature;

    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)dealloc{
    self.window = nil;
    [super dealloc];
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
