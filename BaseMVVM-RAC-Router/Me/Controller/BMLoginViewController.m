//
//  BMLoginViewController.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/8.
//  Copyright © 2018 leios. All rights reserved.
//

#import "BMLoginViewController.h"
#import "AppDelegate.h"
#import "BMLoginAccountInputCell.h"
#import "BMKLoginPwdInputCell.h"
#import "BMLoginViewModel.h"
#import "BMLoginInputFootView.h"

typedef NS_ENUM(NSInteger, kLoginInputType) {
    kLoginInputType_account = 0,
    kLoginInputType_password = 1
};


@interface BMLoginViewController ()

@property (weak, nonatomic) IBOutlet UITableView *LoginTableView;
@property (strong, nonatomic) IBOutlet UIView *tableviewHeaderView;

@property (nonatomic,strong) BMLoginViewModel *viewModel;
@property (nonatomic,strong) BMLoginInputFootView *tableFooterView;

@end

@implementation BMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialDefaultsForController];
    
    [self createViewForConctroller];
    
    [self configNavigationForController];
    
    [self bindViewModelForController];
    
    NSLog(@"%@",self.params);
    
}

- (void)initialDefaultsForController {
    
    [self setViewModel:[[BMLoginViewModel alloc] initWithParams:self.params]];
    
}



- (void)configNavigationForController {
    
}



- (void)createViewForConctroller {
    // 注册cell
    [self.LoginTableView registerNib:[UINib nibWithNibName:NSStringFromClass(BMLoginAccountInputCell.class) bundle:nil] forCellReuseIdentifier:NSStringFromClass(BMLoginAccountInputCell.class)];
    [self.LoginTableView registerNib:[UINib nibWithNibName:NSStringFromClass(BMKLoginPwdInputCell.class) bundle:nil] forCellReuseIdentifier:NSStringFromClass(BMKLoginPwdInputCell.class)];
    
    // tableHeaderView
    self.LoginTableView.tableHeaderView = self.tableviewHeaderView;
    self.tableviewHeaderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3);
    
    self.LoginTableView.tableFooterView = self.tableFooterView;
    
}

- (void)bindViewModelForController {
    @weakify(self);
    
    // 是否可以登录
    
    RAC(self.tableFooterView.loginBtn, enabled) = RACObserve(self.viewModel, isLoginEnable);
    
    // 点击登录信号
    
    [[[self.tableFooterView.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]throttle:0.2] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        
        [self.viewModel.loginCommand execute:nil];
        [self hideKeyBoard];
        
    }];
    
    // 点击遇到问题按钮
    
    [[self.tableFooterView.queryBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"点击了登录遇到问题");
    }];
    
    
    
    // 监听登录信号是否在执行
    [[self.viewModel.loginCommand.executing skip:0.2] subscribeNext:^(NSNumber * _Nullable x) {
        @strongify(self);
        
        if (x.boolValue) {
            [self.tableFooterView.loginBtn startLoadingAnimation];
        } else {
            // 2秒后移除提示框
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.tableFooterView.loginBtn stopLoadingAnimation];
            });
        }
    }];
    
    // 登录命令监听
    [self.viewModel.loginCommand.executionSignals subscribeNext:^(RACSignal* signal) {
        
        [signal subscribeNext:^(id  _Nullable x) {
            
            BOOL isLogin = [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
            if(isLogin){
                
                [[NSNotificationCenter defaultCenter] postNotificationName:BMLoginStateChangedNotificationKey object:nil];
                
                [self dismissViewControllerAnimated:YES completion:nil];
                
                
            }else{
                NSLog(@"登录失败");
            }
        }];
    }];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.cellTitleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case kLoginInputType_account:
        {
            // 账户
            BMLoginAccountInputCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(BMLoginAccountInputCell.class)];
            
            [cell bindViewModel:self.viewModel withParams:@{}];
            
            return cell;
        }
            break;
        case kLoginInputType_password:
        {
            // 密码
            BMKLoginPwdInputCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(BMKLoginPwdInputCell.class)];
            
            [cell bindViewModel:self.viewModel withParams:@{}];
            
            return cell;
        }
            break;
        default:
            break;
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"blankCell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 65;
}

#pragma mark - Getter
- (BMLoginInputFootView *)tableFooterView {
    if (!_tableFooterView){
        _tableFooterView = [[BMLoginInputFootView alloc] init];
        _tableFooterView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 110);
    }
    return _tableFooterView;
}


@end


