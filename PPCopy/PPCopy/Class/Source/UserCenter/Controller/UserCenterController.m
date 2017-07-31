//
//  UserCenterController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/11.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "UserCenterController.h"

@interface UserCenterController ()
@property(nonatomic,strong)UserCenterTableView * userCentView;
@end

@implementation UserCenterController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor  = lightgrey_Color;
    
    [self.view addSubview:self.userCentView];
    
    __weak UserCenterController * weakSelf = self;
    
    self.userCentView.headView.headViewButtonActionBK = ^(NSInteger buttonTag) {
    
        if (buttonTag == 1110) {
            
            [weakSelf RootAddPanGuesterController_popBackButtonAction];
        }else if (buttonTag == 1111){
        
        }else if (buttonTag == 1112){
            
        }else if (buttonTag == 1113){
            
            ReadHestoryController * vc = [[ReadHestoryController alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }else if (buttonTag == 1114){
            
        }
        
    };
}

- (UserCenterTableView *)userCentView{
    if (!_userCentView) {
        
        _userCentView = [[UserCenterTableView alloc]initWithFrame:CGRectMake(0, 20, Screen_with, Screen_heigh - 20)];
    }

    __weak UserCenterController * weakSelf = self;
    
    _userCentView.tableViewDidSelectWithIndexPathBK = ^(NSInteger row) {
        
        if (row == 0) {
            
            NickNameController * vc = [[NickNameController alloc]init];
            vc.isNickName = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];

            
        }else if (row == 1){
        
        }else if (row == 2){
            
            RegisterAndForgetController * vc = [[RegisterAndForgetController alloc]init];
            vc.ischangePhoneAction = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];

        }else if (row == 3){
            
            RegisterAndForgetController * vc = [[RegisterAndForgetController alloc]init];
            vc.isEmailAction = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }else if (row == 4){
            
            AddressController * vc = [[AddressController alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:YES];

        }else if (row == 5){
            
        }else if (row == 6){
            
            ChangePasswordController * vc = [[ChangePasswordController alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }else if (row == 7){
            
            NickNameController * vc = [[NickNameController alloc]init];
            vc.isLocation = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }else if (row == 8){
            
            NickNameController * vc = [[NickNameController alloc]init];
            vc.isSignName = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }
    };
    
    return _userCentView;
}

@end
