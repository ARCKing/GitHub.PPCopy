//
//  RootController.m
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootController.h"

@interface RootController ()


@end

@implementation RootController


- (NSUserDefaults *)userDefault{
    
    if (!_userDefault) {
        
        _userDefault= [NSUserDefaults standardUserDefaults];
    }
    return _userDefault;
}

- (NSString *)token{
            
    NSDictionary * dic = [NSDictionary dictionaryWithDictionary:[self.userDefault objectForKey:@"userInfo"]];
    _token = dic[key_token];
    
    return _token;
}

- (NSString *)uid{
    
    NSDictionary * dic = [NSDictionary dictionaryWithDictionary:[self.userDefault objectForKey:@"userInfo"]];
    _uid = dic[key_uid];
    
    
    return _uid;
}

- (NSString *)login{
    
    NSDictionary * dic = [NSDictionary dictionaryWithDictionary:[self.userDefault objectForKey:@"userInfo"]];
    _login = dic[key_login];
    
    return _login;
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)RootControllerAddUI{
    NSLog(@"RootControllerAddUI");
}

- (void)RootControllerLeftNavBarButtonAction:(UIButton *)leftButton{
    NSLog(@"RootControllerLeftNavBarButtonAction");
}
- (void)RootControllerRightNavBarButtonAction:(UIButton *)rightButton{
    NSLog(@"RootControllerRightNavBarButtonAction");
}

- (void)RootController_popBackButtonAction{

    [self.navigationController popViewControllerAnimated:YES];

}

- (void)RootController_mj_RefreshData{}
- (void)RootController_mj_LoadMoreData{}


- (JsonAnalyzeManger *)jsonAnalyzeManger{
    
    if (!_jsonAnalyzeManger) {
        
        _jsonAnalyzeManger = [JsonAnalyzeManger shareJsonAnaylzeManger];
    }
    return _jsonAnalyzeManger;
}
@end
