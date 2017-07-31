//
//  AboutUsController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/24.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "AboutUsController.h"

@interface AboutUsController ()

@end

@implementation AboutUsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)popBackButtonAction:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];

}

@end
