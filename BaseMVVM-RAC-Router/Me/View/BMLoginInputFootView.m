//
//  BMLoginInputFootView.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/5.
//  Copyright © 2018 leios. All rights reserved.
//

#import "BMLoginInputFootView.h"

@implementation BMLoginInputFootView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.loginBtn];
        [self addSubview:self.queryBtn];
    }
    return self;
}

#pragma mark - Layout
- (void)updateConstraints
{
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(8);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(40);
    }];
    
    [self.queryBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.loginBtn);
        make.size.mas_equalTo(self.loginBtn);
        make.top.mas_equalTo(self.loginBtn.mas_bottom).offset(10);
    }];
    
    [super updateConstraints];
}

#pragma mark - Getter
- (BMLoginButton *)loginBtn
{
    if (!_loginBtn) {
        
        _loginBtn = [[BMLoginButton alloc] init];
        _loginBtn.enabled = NO;
    }
    return _loginBtn;
}

- (UIButton *)queryBtn
{
    if (!_queryBtn) {
        
        _queryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_queryBtn setTitle:@"登录遇到问题？" forState:UIControlStateNormal];
        [_queryBtn setTitleColor:BMTHEMECOLOR forState:UIControlStateNormal];
        _queryBtn.titleLabel.font =  [UIFont systemFontOfSize:17];
    }
    return _queryBtn;
}

@end
