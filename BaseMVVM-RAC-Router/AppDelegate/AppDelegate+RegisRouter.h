//
//  AppDelegate+RegisRouter.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/3.
//  Copyright © 2018 leios. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (RegisRouter)

+ (void)registerNavgationRouter;

+ (void)registerSchemaRouter;

@end

NS_ASSUME_NONNULL_END
