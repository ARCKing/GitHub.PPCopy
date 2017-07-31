//
//  UserRespondsController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/24.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "UserRespondsController.h"

@interface UserRespondsController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

@implementation UserRespondsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addUI];
}

- (void)addUI{

    self.textView.layer.borderWidth = 0.5;
    self.textView.layer.borderColor = lightgrey_Color.CGColor;
    self.textView.delegate = self;
    
}

- (void)textViewDidEndEditing:(UITextView *)textView{


}


- (IBAction)textFieldEditingDidEnd:(id)sender {
}


- (IBAction)popBackButtonAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)submitButtonAction:(id)sender {
    
    NSLog(@"submitButtonAction");
}

@end
