//
//  JoinUsController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/24.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "JoinUsController.h"

@interface JoinUsController ()

@end

@implementation JoinUsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)popBackButtonAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)QQButtonAction:(id)sender {
    
    NSLog(@"加群");
    
    
    [self joinGroup:@"" key:nil];
    
}



//加群
- (BOOL)joinGroup:(NSString *)groupUin key:(NSString *)key{
    
    NSString *urlStr = [NSString stringWithFormat:@"mqqapi://card/show_pslcard?src_type=internal&version=1&uin=%@&key=%@&card_type=group&source=external", groupUin,key];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
        return YES;
    }
    else return NO;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
