//
//  BMAPILoginRequest.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/6.
//  Copyright © 2018 leios. All rights reserved.
//

#import "BMAPILoginRequest.h"
// 登录token key
NSString *BMLoginAccessTokenKey = @"accessToken";

@implementation BMAPILoginRequest {
    NSString *_usr;
    NSString *_pwd;
}

- (id)initWithUsr:(NSString *)usr pwd:(NSString *)pwd {
    self = [super init];
    if (self) {
        _usr = usr;
        _pwd = pwd;
    }
    return self;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (YTKResponseSerializerType)responseSerializerType {
    return YTKResponseSerializerTypeJSON;
}
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (BOOL)statusCodeValidator {
    return YES;
}

//// 可以在这里对response 数据进行重新格式化， 也可以使用delegate 设置 reformattor
//- (id)reformJSONResponse:(id)jsonResponse
//{
//
//}

- (NSString *)requestUrl {
    return @"http://ip.taobao.com/service/getIpInfo.php";
}


- (id)requestArgument {
    
    return  @{
              @"username":_usr,
              @"password":_pwd,
              @"ip":@"myip"
              };
}

@end
