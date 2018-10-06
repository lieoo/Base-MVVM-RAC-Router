//
//  BMLoginButton.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/5.
//  Copyright © 2018 leios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BMLoginButton : UIButton
/**
 开始加载动画
 */
- (void)startLoadingAnimation;

/**
 结束加载动画
 */
- (void)stopLoadingAnimation;
@end

NS_ASSUME_NONNULL_END
