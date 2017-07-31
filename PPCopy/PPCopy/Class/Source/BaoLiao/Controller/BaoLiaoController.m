//
//  BaoLiaoController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/10.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "BaoLiaoController.h"

@interface BaoLiaoController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UILabel *characterNumber;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation BaoLiaoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.textView.layer.borderWidth = 1.0;
    self.textView.layer.borderColor = lightgrey_Color.CGColor;
    self.textView.delegate = self;
}



- (void)textViewDidBeginEditing:(UITextView *)textVie{

    NSLog(@"textViewDidBeginEditing");
}


- (void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"textViewDidBeginEditing");

}

- (IBAction)phoneTextFieldEditingDidEnd:(id)sender {
    
    NSLog(@"phoneTextFieldEditingDidEnd");

}



- (IBAction)popBackButtonAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)addPicButtonAction:(id)sender {
    NSLog(@"addPicButtonAction");
}


- (IBAction)baoLiaoButtonAction:(id)sender {
    
    NSLog(@"baoLiaoButtonAction");
}

@end
