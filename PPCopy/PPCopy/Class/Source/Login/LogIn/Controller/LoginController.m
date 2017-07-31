//
//  LoginController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/7.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()

@property (weak, nonatomic) IBOutlet UIButton *weiChatButton;
@property (weak, nonatomic) IBOutlet UIButton *QQButton;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


@property (nonatomic,copy)NSString * phone;
@property (nonatomic,copy)NSString * password;


@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.weiChatButton setImageEdgeInsets:UIEdgeInsetsMake(-self.weiChatButton.titleLabel.intrinsicContentSize.height, 0, 0, -self.weiChatButton.titleLabel.intrinsicContentSize.width)];
    [self.weiChatButton setTitleEdgeInsets:UIEdgeInsetsMake(self.weiChatButton.currentImage.size.height + self.weiChatButton.titleLabel.intrinsicContentSize.height, -self.weiChatButton.currentImage.size.width, 0, 0)];
    self.weiChatButton.userInteractionEnabled = NO;
    
    
    [self.QQButton setImageEdgeInsets:UIEdgeInsetsMake(-self.QQButton.titleLabel.intrinsicContentSize.height, 0, 0, -self.QQButton.titleLabel.intrinsicContentSize.width)];
    [self.QQButton setTitleEdgeInsets:UIEdgeInsetsMake(self.QQButton.currentImage.size.height + self.QQButton.titleLabel.intrinsicContentSize.height, -self.QQButton.currentImage.size.width, 0, 0)];
    self.QQButton.userInteractionEnabled = NO;
}



- (IBAction)popBackButtonAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)phoneTextFieldEditingDidEnd:(id)sender {
    
    NSLog(@"%@",self.phoneTextField.text);
    
}


- (IBAction)passWorldTextFieldEditingEnd:(id)sender {
    
    NSLog(@"%@",self.passwordTextField.text);

}


- (IBAction)loginButtonAction:(id)sender {
    
    [self.passwordTextField resignFirstResponder];
    [self.phoneTextField resignFirstResponder];
    
    NSLog(@"--%@",self.passwordTextField.text);
    
    
    [self.jsonAnalyzeManger customLoginActionWithPhoneNumber:self.phoneTextField.text andPassword:self.passwordTextField.text complete:^(NSString *code, NSString *message, NSString *otherStr, NSArray *arr1, NSArray *arr2, NSDictionary *dic) {
       
        if ([code isEqualToString:@"1"]) {
            
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    }];

}


/**注册*/
- (IBAction)registerButtonAction:(id)sender {
    
    RegisterAndForgetController * vc = [[RegisterAndForgetController alloc]init];
    vc.isRegisterAction = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

/**忘记密码*/
- (IBAction)forgetButtonAction:(id)sender {
    
    
    RegisterAndForgetController * vc = [[RegisterAndForgetController alloc]init];
    vc.isForgetAction = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}






- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSLog(@"touchesBegan");
    
    [self.passwordTextField resignFirstResponder];
    [self.phoneTextField resignFirstResponder];

    
}


@end
