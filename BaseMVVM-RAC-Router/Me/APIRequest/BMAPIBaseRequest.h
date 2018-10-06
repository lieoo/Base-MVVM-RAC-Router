//
//  BMAPIBaseRequest.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/6.
//  Copyright © 2018 leios. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

// 获取服务器响应状态码 key
FOUNDATION_EXTERN NSString *const BM_BaseRequest_StatusCodeKey;
// 服务器响应数据成功状态码 value
FOUNDATION_EXTERN NSString *const BM_BaseRequest_DataValueKey;
// 获取服务器响应状态信息 key
FOUNDATION_EXTERN NSString *const BM_BaseRequest_StatusMsgKey;
// 获取服务器响应数据 key
FOUNDATION_EXTERN NSString *const BM_BaseRequest_DataKey;

@class BMAPIBaseRequest;
@protocol BMBaseRequestFeformDelegate <NSObject>

/**
 自定义解析器解析响应参数
 
 @param request 当前请求
 @param jsonResponse 响应数据
 @return 自定reformat数据
 */
- (id)request:(BMAPIBaseRequest *)request reformJSONResponse:(id)jsonResponse;

@end

@interface BMAPIBaseRequest : YTKRequest


/**
 数据重塑代理
 */
@property (nonatomic, weak) id <BMBaseRequestFeformDelegate> reformDelegate;

#pragma mark - Override

/**
 自定义解析器解析响应参数
 
 @param jsonResponse json响应
 @return 解析后的json
 */
- (id)reformJSONResponse:(id)jsonResponse;

#pragma mark - Subclass Ovrride

/**
 添加额外的参数
 
 @return 额外参数
 */
- (id)extraRequestArgument;

- (RACSignal *)rac_requestSignal;

@end

NS_ASSUME_NONNULL_END
