//
//  BMAPILoginRequest.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/6.
//  Copyright © 2018 leios. All rights reserved.
//

#import "BMAPIBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

/* 大多时候Api只需要一种解析格式，所以此处跟着request走，其他情况下常量字符串建议跟着reformer走， */
// 登录token key
FOUNDATION_EXTERN NSString *BMLoginAccessTokenKey;
// 也可以写成 局部常量形式
static const NSString *BMLoginAccessTokenKey2 = @"accessToken";

@interface BMAPILoginRequest : BMAPIBaseRequest

- (id)initWithUsr:(NSString *)usr pwd:(NSString *)pwd;

@end

NS_ASSUME_NONNULL_END
