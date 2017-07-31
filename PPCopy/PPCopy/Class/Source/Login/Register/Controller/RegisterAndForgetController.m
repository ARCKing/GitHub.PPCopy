//
//  RegisterAndForgetController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/7.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RegisterAndForgetController.h"

@interface RegisterAndForgetController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (weak, nonatomic) IBOutlet UIButton *inviateButton;

@end

@implementation RegisterAndForgetController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.inviateButton.layer.borderColor = deepskyblue_Color.CGColor;
    self.inviateButton.layer.borderWidth = 0.5;
    
    
    if (self.isForgetAction) {
        
        [self changeTitle:@"忘记密码" andButtonTitle:@"获取验证码" andChangePlaceholder:@"请输入注册时的手机或电子邮箱"];

    }else if (self.ischangePhoneAction){
    
        [self changeTitle:@"修改手机" andButtonTitle:@"获取验证码" andChangePlaceholder:@"请输入新的手机号"];

    }else if (self.isEmailAction){
        
        [self changeTitle:@"修改邮箱" andButtonTitle:@"获取验证码" andChangePlaceholder:@"请输入新邮箱"];
    }

    
}


- (void)changeTitle:(NSString *)title andButtonTitle:(NSString *)buttonTitle andChangePlaceholder:(NSString *)placeholder{

    self.titleLabel.text = title;
    [self.inviateButton setTitle:buttonTitle forState:UIControlStateNormal];
    self.phoneTextField.placeholder = placeholder;
}



- (IBAction)comeBackButtonAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)enterButtonAction:(id)sender {
}


- (IBAction)phoneTextFieldEditingDidEnd:(id)sender {

}


- (IBAction)inviateCodeTextFieldEditingDidEnd:(id)sender {
}

@end
