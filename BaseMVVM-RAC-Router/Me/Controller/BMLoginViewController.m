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

- (void)bm_bindViewModelForController {
    
    
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
            
            [cell bindViewModel:self.viewModel withParams:nil];
            
            return cell;
        }
            break;
        case kLoginInputType_password:
        {
            // 密码
            BMKLoginPwdInputCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(BMKLoginPwdInputCell.class)];
            
            [cell bindViewModel:self.viewModel withParams:nil];
            
            return cell;
        }
            break;
        default:
            break;
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"blankCell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 65;
}

#pragma mark - Getter
- (BMLoginInputFootView *)tableFooterView
{
    if (!_tableFooterView){
        _tableFooterView = [[BMLoginInputFootView alloc] init];
        _tableFooterView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 110);
    }
    return _tableFooterView;
}


@end
