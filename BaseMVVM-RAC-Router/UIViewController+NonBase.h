//
//  UIViewController+NonBase.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/28.
//  Copyright © 2018 leios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMControllMVVMProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (NonBase)

/**
 去Model&&表征化参数列表
 */
@property (nonatomic, strong) NSDictionary *params;

/**
 ViewModel 属性
 */
@property (nonatomic, strong) id <BMControllMVVMProtocol> viewModel;

#pragma mark - 通用类

/**
 返回Controller的当前bounds
 
 @param hasNav 是否有导航栏
 @param hasTabBar 是否有tabbar
 @return 坐标
 */
- (CGRect)fk_visibleBoundsShowNav:(BOOL)hasNav showTabBar:(BOOL)hasTabBar;

/**
 隐藏键盘
 */
- (void)hideKeyBoard;

@end

NS_ASSUME_NONNULL_END
