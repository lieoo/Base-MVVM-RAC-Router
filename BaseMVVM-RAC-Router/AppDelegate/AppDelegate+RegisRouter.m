//
//  AppDelegate+RegisRouter.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/3.
//  Copyright © 2018 leios. All rights reserved.
//

#import "AppDelegate+RegisRouter.h"

@implementation AppDelegate (RegisRouter)

#pragma mark - 普通的跳转路由注册

+ (void)registerNavgationRouter
{
    // push
    // 路由 /com_madao_navPush/:viewController
    [[JLRoutes globalRoutes] addRoute:BMNavPushRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [AppDelegate _handlerSceneWithPresent:NO parameters:parameters];
            
        });
        return YES;
    }];
    
    // present
    // 路由 /com_madao_navPresent/:viewController
    [[JLRoutes globalRoutes] addRoute:BMNavPresentRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [AppDelegate _handlerSceneWithPresent:YES parameters:parameters];
        });
        return YES;
    }];
    
    
    
    // sb push
    // 路由 /com_madao_navStoryboardPush/:viewController
    [[JLRoutes globalRoutes] addRoute:BMNavStoryBoardPushRoute handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        return YES;
    }];
    
}


#pragma mark - Private
/// 处理跳转事件
+ (void)_handlerSceneWithPresent:(BOOL)isPresent parameters:(NSDictionary *)parameters
{
    // 当前控制器
    NSString *controllerName = [parameters objectForKey:BMControllerNameRouteParam];
    UIViewController *currentVC = [self _currentViewController];
    UIViewController *toVC = [[NSClassFromString(controllerName) alloc] init];
    toVC.params = parameters;
    if (currentVC && currentVC.navigationController) {
        if (isPresent) {
            [currentVC.navigationController presentViewController:toVC animated:YES completion:nil];
        }else
        {
            [currentVC.navigationController pushViewController:toVC animated:YES];
        }
    }
}
/// 获取当前控制器
+ (UIViewController *)_currentViewController{
    
    UIViewController * currVC = nil;
    UIViewController * Rootvc = [UIApplication sharedApplication].keyWindow.rootViewController ;
    do {
        if ([Rootvc isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = (UINavigationController *)Rootvc;
            UIViewController * v = [nav.viewControllers lastObject];
            currVC = v;
            Rootvc = v.presentedViewController;
            continue;
        }else if([Rootvc isKindOfClass:[UITabBarController class]]){
            UITabBarController * tabVC = (UITabBarController *)Rootvc;
            currVC = tabVC;
            Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        }
    } while (Rootvc!=nil);
    
    return currVC;
}


+ (void)registerSchemaRouter {
    // HTTP注册
    [[JLRoutes routesForScheme:BMHTTPRouteSchema] addRoute:@"/somethingHTTP" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        return NO;
    }];
    
    // HTTPS注册
    [[JLRoutes routesForScheme:BMHTTPsRouteSchema] addRoute:@"/somethingHTTPs" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return NO;
        
    }];
    
    // 自定义 Schema注册
    [[JLRoutes routesForScheme:BMWebHandlerRouteSchema] addRoute:@"/somethingCustom" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return NO;
        
    }];
}


@end
