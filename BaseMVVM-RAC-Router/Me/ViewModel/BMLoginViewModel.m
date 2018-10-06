//
//  BMLoginViewModel.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/8.
//  Copyright © 2018 leios. All rights reserved.
//

#import "BMLoginViewModel.h"

@implementation BMLoginViewModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initModel];
    }
    return self;
}

- (void)initModel {
    
    _cellTitleArray = @[
                        @"账户",
                        @"密码",
                        ];
    
    // 是否可以登录
    RAC(self, isLoginEnable) =  [[RACSignal combineLatest:@[
                                                            RACObserve(self, userAccount),
                                                            RACObserve(self, password)]
                                  ]
                                 map:^id _Nullable(RACTuple * _Nullable value) {
                                     RACTupleUnpack(NSString *account, NSString *pwd) = value;
                                     return @(account && pwd && account.length && pwd.length);
                                 }];
}

#pragma mark - Getter
- (RACCommand *)loginCommand
{
    if (!_loginCommand) {
        @weakify(self);
//        _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
//            @strongify(self);
//            NSLog(@"111");
////            FKLoginRequest *loginRequest = [[FKLoginRequest alloc] initWithUsr:self.userAccount pwd:self.password];
////            // 数据返回值reformat代理
////            // loginRequest.reformDelegate = self;
////            // 数据请求响应代理 通过代理回调
////            // loginRequest.delegate = self;
//            return [[[loginRequest rac_requestSignal] doNext:^(id  _Nullable x) {
////
////
////                // 解析数据
////                [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"isLogin"];
////
//            }] materialize];
//        }];
    }
    return _loginCommand;
}

#pragma mark - FKBaseRequestFeformDelegate
//- (id)request:(FKBaseRequest *)request reformJSONResponse:(id)jsonResponse
//{
//    if([request isKindOfClass:FKLoginRequest.class]){
//        // 在这里对json数据进行重新格式化
//        return @{
//                 FKLoginAccessTokenKey : jsonResponse[@"token"],
//                 // FKLoginAccessTokenKey : DecodeStringFromDic(jsonResponse, @"token"),
//                 };
//    }
//    return jsonResponse;
//}
//
//#pragma mark - YTKRequestDelegate
//- (void)requestFinished:(__kindof YTKBaseRequest *)request
//{
//    // 解析数据
//    [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"isLogin"];
//}
//
//- (void)requestFailed:(__kindof YTKBaseRequest *)request
//{
//    // do something
//}


@end
