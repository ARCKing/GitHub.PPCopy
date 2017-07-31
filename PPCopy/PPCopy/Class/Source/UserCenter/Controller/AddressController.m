//
//  AddressController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/12.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "AddressController.h"

@interface AddressController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textField;

@end

@implementation AddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.delegate = self;
    self.textField.layer.borderWidth = 1.0;
    self.textField.layer.borderColor = lightgrey_Color.CGColor;
}

- (IBAction)popBackButtonAction:(id)sender {
    
    [self RootAddPanGuesterController_popBackButtonAction];
}



- (IBAction)enterButtonAction:(id)sender {
}


- (void)textViewDidEndEditing:(UITextView *)textView{

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.textField resignFirstResponder];

}

@end
