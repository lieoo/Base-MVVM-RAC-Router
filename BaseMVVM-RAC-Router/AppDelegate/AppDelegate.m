//
//  AppDelegate.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/8.
//  Copyright © 2018 leios. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "AppDelegate+AdapterForIOS11.h"
#import "AppDelegate+RegisRouter.h"
#import "AppDelegate+AppUrlConfig.h"
#import "AppDelegate+AspectsHotfix.h"
#import "BMTabbarController.h"
#import "BMLoginViewController.h"
#import "AppDelegate+AppUrlConfig.h"

NSString *const BMLoginStateChangedNotificationKey = @"LoginStateChangedNotificationKey";

@interface AppDelegate ()

@property (nonatomic, strong) BMTabbarController *tabbarController;
@property (nonatomic, strong) BMLoginViewController *loginController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

#pragma mark -- HotFix 此方法有被拒风险 请酌情考虑 
    [AppDelegate repair];
    
    [AppDelegate registerSchemaRouter];
    
    [AppDelegate registerNavgationRouter];
    
    [AppDelegate configScrollViewAdapt4IOS11];

    [AppDelegate configNetWrokApiEnv];
    
    [self setUpRootController];
    
    return YES;
}
- (void)setUpRootController {
    
    self.window = [[UIWindow alloc]initWithFrame:UIScreen.mainScreen.bounds];
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:BMLoginStateChangedNotificationKey object:nil]
     subscribeNext:^(NSNotification * _Nullable x) {
         NSNumber * number = [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
         BOOL isLogin = NO;
         if (number) {
             isLogin = number.boolValue;
         }
         if (isLogin) {//已登录
             [self.window setRootViewController:self.tabbarController];
         }else//未登录
         {
             [self.window setRootViewController:self.loginController];
         }
     }];
    
    //直接发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:BMLoginStateChangedNotificationKey object:nil];
    
    [self.window makeKeyAndVisible];

}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    
    // 默认的路由 跳转等等
    if ([[url scheme] isEqualToString:BMDefaultRouteSchema]) {
        
        return [[JLRoutes globalRoutes] routeURL:url];
    }
    // http
    else if ([[url scheme] isEqualToString:BMHTTPRouteSchema])
    {
        return [[JLRoutes routesForScheme:BMHTTPRouteSchema] routeURL:url];
    }
    // https
    else if ([[url scheme] isEqualToString:BMHTTPsRouteSchema])
    {
        return [[JLRoutes routesForScheme:BMHTTPsRouteSchema] routeURL:url];
    }
    // Web交互请求
    else if ([[url scheme] isEqualToString:BMWebHandlerRouteSchema])
    {
        return [[JLRoutes routesForScheme:BMWebHandlerRouteSchema] routeURL:url];
    }
    // 请求回调
    else if ([[url scheme] isEqualToString:BMComponentsCallBackHandlerRouteSchema])
    {
        return [[JLRoutes routesForScheme:BMComponentsCallBackHandlerRouteSchema] routeURL:url];
    }
    // 未知请求
    else if ([[url scheme] isEqualToString:BMUnknownHandlerRouteSchema])
    {
        return [[JLRoutes routesForScheme:BMUnknownHandlerRouteSchema] routeURL:url];
    }
    return NO;
}

#pragma mark - Getter
-(BMTabbarController *)tabbarController{
    if (!_tabbarController) {
        _tabbarController = [[BMTabbarController alloc]init];
    }
    return _tabbarController;
}

- (BMLoginViewController *)loginController
{
    if (!_loginController) {
        _loginController = [[BMLoginViewController alloc] init];
    }
    return _loginController;
}

@end
