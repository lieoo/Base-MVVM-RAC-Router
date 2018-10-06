//
//  BMControllMVVMProtocol.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/5.
//  Copyright © 2018 leios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BMControllMVVMProtocol <NSObject>
#pragma mark - 方法绑定
@required

- (void)bm_initialDefaultsForController;

/// 绑定 vm
- (void)bm_bindViewModelForController;

/// 创建视图
- (void)bm_createViewForConctroller;

/// 配置导航栏
- (void)bm_configNavigationForController;


@end

NS_ASSUME_NONNULL_END
