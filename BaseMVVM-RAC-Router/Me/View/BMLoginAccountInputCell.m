//
//  BMLoginAccountInputCell.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/5.
//  Copyright © 2018 leios. All rights reserved.
//

#import "BMLoginAccountInputCell.h"

@implementation BMLoginAccountInputCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self creatView];
    
}
- (void)creatView{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryNone;
    self.textLabel1.font = [UIFont systemFontOfSize:17];
    //设置textfield属性
    self.inputTextFiled.font = [UIFont systemFontOfSize:17];
    self.inputTextFiled.spellCheckingType = UITextSpellCheckingTypeNo;
    self.inputTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    self.inputTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.inputTextFiled.keyboardType = UIKeyboardTypeASCIICapable;
    self.inputTextFiled.secureTextEntry = NO;
    // 账户样式
    self.inputTextFiled.returnKeyType = UIReturnKeyNext;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



#pragma mark - Bind ViewModel
- (void)bindViewModel:(BMLoginViewModel *)viewModel withParams:(NSDictionary *)params
{
    
    if ([viewModel isKindOfClass:[BMLoginViewModel class]]){
        
        BMLoginViewModel *_viewModel = (BMLoginViewModel *)viewModel;
        // 绑定账号 View -> ViewModel 传递数据
        @weakify(self);
        RAC(_viewModel, userAccount) = [[self.inputTextFiled.rac_textSignal takeUntil:self.rac_prepareForReuseSignal] map:^id _Nullable(NSString * _Nullable account) {
            
            @strongify(self);
            // 限制账号长度
            if (account.length > 25) {
                self.inputTextFiled.text = [account substringToIndex:25];
            }
            return self.inputTextFiled.text;
        }];
    }
}

@end
