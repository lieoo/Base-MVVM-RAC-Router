//
//  BMRouterConstant.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/27.
//  Copyright © 2018 leios. All rights reserved.
//


#import <Foundation/Foundation.h>

// 路由默认控制器参数名
FOUNDATION_EXTERN NSString *const BMControllerNameRouteParam;
FOUNDATION_EXTERN NSString *const BMPresentRouteSchema;

#pragma mark - 路由模式 Schema
/**
 模式 Native：AppSchema://url/:param
 */

// 默认路由
FOUNDATION_EXTERN NSString *const BMDefaultRouteSchema;
// 网络跳转路由模式
FOUNDATION_EXTERN NSString *const BMHTTPRouteSchema;
FOUNDATION_EXTERN NSString *const BMHTTPsRouteSchema;
// WEB交互路由跳转模式
FOUNDATION_EXTERN NSString *const BMWebHandlerRouteSchema;
// 回调通信
FOUNDATION_EXTERN NSString *const BMComponentsCallBackHandlerRouteSchema;
// 未知路由
FOUNDATION_EXTERN NSString *const BMUnknownHandlerRouteSchema;


#pragma mark - 路由表

// 导航栏 Push
FOUNDATION_EXTERN NSString *const BMNavPushRoute;

FOUNDATION_EXTERN NSString *const BMNavPresentRoute;

// 导航栏 Present
FOUNDATION_EXTERN NSString *const BMNavPresentRoute;

// StoryBoard Push
FOUNDATION_EXTERN NSString *const BMNavStoryBoardPushRoute;

// 组件通信回调
FOUNDATION_EXTERN NSString *const BMComponentsCallBackRoute;
