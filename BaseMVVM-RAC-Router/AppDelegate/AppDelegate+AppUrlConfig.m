//
//  AppDelegate+AppUrlConfig.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/8.
//  Copyright © 2018 leios. All rights reserved.
//

#import "AppDelegate+AppUrlConfig.h"
#import "YTKNetwork.h"

//#import "YTKNetworkAgent.h"

#define HOST_URL @"http://api.qingyunke.com"
#define CDN_URL @""
@implementation AppDelegate (AppUrlConfig)

+ (void)configNetWrokApiEnv{
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = HOST_URL;
//    config.cdnUrl = CDN_URL;
    
    
    
// 配置 Header 接受信息
    
    YTKNetworkAgent *agent = [YTKNetworkAgent sharedAgent];
    NSSet *acceptableContentTypes = [NSSet setWithObjects:
                                     @"application/json",
                                     @"text/json",
                                     @"text/javascript",
                                     @"text/plain",
                                     @"text/html",
                                     @"text/css", nil];
    
    NSString *keypath = @"jsonResponseSerializer.acceptableContentTypes";
    
    @try {
        [agent setValue:acceptableContentTypes forKeyPath:keypath];
    } @catch (NSException *exception) {
        
    } @finally {

    }
}

@end
