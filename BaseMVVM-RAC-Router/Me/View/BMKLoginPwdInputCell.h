//
//  FKLoginPwdInputCell.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/5.
//  Copyright © 2018 leios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMLoginViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BMKLoginPwdInputCell : UITableViewCell<UITextFieldDelegate>

/**
 标题
 */

@property (strong, nonatomic) IBOutlet UITextField *inputTextFiled;


//@property (weak, nonatomic) IBOutlet UILabel *textLabel;

/**
 输入框
 */

/**
 操作按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *accessoryButton;


- (void)bindViewModel:(BMLoginViewModel *)viewModel withParams:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
