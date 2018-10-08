//
//  BMLoginViewModel.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/8.
//  Copyright © 2018 leios. All rights reserved.
//

#import "BMLoginViewModel.h"
#import "BMAPILoginRequest.h"

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
- (RACCommand *)loginCommand {
    if (!_loginCommand) {
        
        @weakify(self);
        _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            BMAPILoginRequest *loginRequest = [[BMAPILoginRequest alloc]initWithUsr:self.userAccount pwd:self.password];
            
            return [[[loginRequest.rac_requestSignal doNext:^(id  _Nullable x) {
                // 解析数据
                NSLog(@"%@",x);
                
                [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"isLogin"];
                
            }] doError:^(NSError * _Nonnull error) {

            }]materialize];
        
        }];
    }
    return _loginCommand;
}

#pragma mark - BMBaseRequestFeformDelegate
- (id)request:(BMAPIBaseRequest *)request reformJSONResponse:(id)jsonResponse {
    
    if (!jsonResponse) {
        return @{};
    }
    if([request isKindOfClass:BMAPILoginRequest.class]){
        // 在这里对json数据进行重新格式化
        return @{
//                 BMLoginAccessTokenKey : jsonResponse[@"token"],
                  BMLoginAccessTokenKey : DecodeStringFromDic(jsonResponse, @"content"),
                 };
    }
    return jsonResponse;
}


@end
