//
//  BMRouterConstant.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/27.
//  Copyright © 2018 leios. All rights reserved.
//


#import "BMRouterConstant.h"

NSString *const FKControllerNameRouteParam = @"viewController";

#pragma mark - 路由模式

NSString *const FKDefaultRouteSchema = @"FXXKBaseMVVM";
NSString *const FKHTTPRouteSchema = @"http";
NSString *const FKHTTPsRouteSchema = @"https";
// ----
NSString *const FKComponentsCallBackHandlerRouteSchema = @"AppCallBack";
NSString *const FKWebHandlerRouteSchema = @"yinzhi";
NSString *const FKUnknownHandlerRouteSchema = @"UnKnown";

#pragma mark - 路由表

NSString *const FKNavPushRoute = @"/com_madao_navPush/:viewController";
NSString *const FKNavPresentRoute = @"/com_madao_navPresent/:viewController";
NSString *const FKNavStoryBoardPushRoute = @"/com_madao_navStoryboardPush/:viewController";
NSString *const FKComponentsCallBackRoute = @"/com_madao_callBack/*";
