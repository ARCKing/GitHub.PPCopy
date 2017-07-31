//
//  RootController.h
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonAnalyzeManger.h"

@interface RootController : UIViewController

@property(nonatomic,copy)NSString * token;
@property(nonatomic,copy)NSString * uid;
@property(nonatomic,copy)NSString * login;

@property(nonatomic,strong)NSUserDefaults * userDefault;

@property(nonatomic,strong)JsonAnalyzeManger * jsonAnalyzeManger;


- (void)RootControllerAddUI;



- (void)RootControllerLeftNavBarButtonAction:(UIButton *)leftButton;

- (void)RootControllerRightNavBarButtonAction:(UIButton *)rightButton;


- (void)RootController_popBackButtonAction;



- (void)RootController_mj_RefreshData;

- (void)RootController_mj_LoadMoreData;

@end
