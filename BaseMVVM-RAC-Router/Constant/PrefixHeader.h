//
//  PrefixHeader.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/27.
//  Copyright © 2018 leios. All rights reserved.
//

#ifndef PrefixHeader_h
#define PrefixHeader_h

//#ifndef __IPHONE_8_0
//#warning "This project uses features only available in iOS SDK 8.0 and later."
//#endif


#ifdef __OBJC__
// 提示组件
//#import "SVProgressHUD+Helper.h"
// 全局定义

#import "BMGlobalDefine.h"
#import "BMFuncationDefine.h"

// 响应式框架
#import "ReactiveObjC.h"
// 自动布局框架
#import "Masonry.h"
// 路由常量
//#import "JLRoutes+GenerateURL.h"
#import "JLRoutes+GenerateURLSupport.h"
#import "BMRouterConstant.h"
// Request RAC
//#import "FKBaseRequest+Rac.h"

// FXXK Base Protocol
//#import "FKViewProtocol.h"
//#import "FKViewModelProtocol.h"
//#import "FKViewControllerProtocol.h"
#import "BMControllMVVMProtocol.h"
#import "NSObject+NonBase.h"
#import "UIViewController+NonBase.h"

// Category
//#import "UIView+NonBase.h"
//#import "NSObject+NonBase.h"
//#import "UIViewController+NonBase.h"
#import "UIColor+Tools.h"
#import "UIImage+Tools.h"

#endif


#endif /* PrefixHeader_h */
