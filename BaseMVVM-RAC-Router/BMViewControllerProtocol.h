//
//  BMViewControllerProtocol.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/28.
//  Copyright © 2018 leios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BMViewControllerProtocol <NSObject>

/**
 为 ViewController 绑定方法协议
 */
#pragma mark - 方法绑定
@required
/// 初始化数据
- (void)fk_initialDefaultsForController;

/// 绑定 vm
- (void)fk_bindViewModelForController;

/// 创建视图
- (void)fk_createViewForConctroller;

/// 配置导航栏
- (void)fk_configNavigationForController;

@end

NS_ASSUME_NONNULL_END
