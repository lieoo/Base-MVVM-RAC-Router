//
//  BMRouterConstant.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/27.
//  Copyright © 2018 leios. All rights reserved.
//


#import "BMRouterConstant.h"

NSString *const BMControllerNameRouteParam = @"viewController";

#pragma mark - 路由模式

NSString *const BMDefaultRouteSchema = @"FXXKBaseMVVM";
NSString *const BMPresentRouteSchema = @"FXXKPresent";

NSString *const BMHTTPRouteSchema = @"http";
NSString *const BMHTTPsRouteSchema = @"https";
// ----
NSString *const BMComponentsCallBackHandlerRouteSchema = @"AppCallBack";
NSString *const BMWebHandlerRouteSchema = @"yinzhi";
NSString *const BMUnknownHandlerRouteSchema = @"UnKnown";

#pragma mark - 路由表

NSString *const BMNavPushRoute = @"/com_madao_navPush/:viewController";

NSString *const BMNavPresentRoute = @"/com_madao_PresentPush/:viewController";

NSString *const BMNavStoryBoardPushRoute = @"/com_madao_navStoryboardPush/:viewController";
NSString *const BMComponentsCallBackRoute = @"/com_madao_callBack/*";
