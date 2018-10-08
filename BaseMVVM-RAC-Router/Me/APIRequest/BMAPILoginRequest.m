//
//  BMAPILoginRequest.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/6.
//  Copyright © 2018 leios. All rights reserved.
//

#import "BMAPILoginRequest.h"
// 登录token key
NSString *BMLoginAccessTokenKey = @"content";

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


//- (id)reformJSONResponse:(id)jsonResponse
//{
//
//}

- (NSString *)requestUrl {
    return @"/api.php";
}

- (id)requestArgument {
    
    return  @{
//              @"username":_usr,
//              @"password":_pwd,
              
              @"key":@"free",
              @"appid":@"0",
              @"msg":_usr
              };
}

@end
