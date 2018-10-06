//
//  BMLoginAccountInputCell.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/5.
//  Copyright © 2018 leios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMLoginViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BMLoginAccountInputCell : UITableViewCell

/**
 标题
 */
@property (weak, nonatomic) IBOutlet UILabel *textLabel1;

/**
 输入框
 */
@property (weak, nonatomic) IBOutlet UITextField *inputTextFiled;


- (void)bindViewModel:(BMLoginViewModel *)viewModel withParams:(NSDictionary *)params;


@end

NS_ASSUME_NONNULL_END
