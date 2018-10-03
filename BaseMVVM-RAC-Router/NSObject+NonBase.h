//
//  NSObject+NonBase.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/28.
//  Copyright © 2018 leios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (NonBase)

/**
 去表征化参数列表
 */
@property (nonatomic, strong, readonly) NSDictionary *params;

/**
 初始化方法
 */
- (instancetype)initWithParams:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
