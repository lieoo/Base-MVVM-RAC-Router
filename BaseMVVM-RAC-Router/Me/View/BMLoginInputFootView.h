//
//  BMLoginInputFootView.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/5.
//  Copyright © 2018 leios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMLoginButton.h"
NS_ASSUME_NONNULL_BEGIN

@interface BMLoginInputFootView : UITableViewHeaderFooterView
/**
 登录按钮
 */
@property (nonatomic, strong) BMLoginButton *loginBtn;

/**
 查询按钮
 */
@property (nonatomic, strong) UIButton *queryBtn;
@end

NS_ASSUME_NONNULL_END
