//
//  SliderController.h
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootController.h"
#import "LeftController.h"

@interface SliderController : RootController

@property(nonatomic,strong)UINavigationController * mainController;
@property(nonatomic,strong)UINavigationController * leftController;

@property(nonatomic,strong)UIView * maskView;

/**push所需要的NavigationController由mainController提供*/
@property(nonatomic,strong)UINavigationController * sliderNavigationController;

@property(nonatomic,strong)UITabBarController * sliderTabBarController;

/**是否打开*/
@property(nonatomic,assign)BOOL isOpenState;


- (instancetype)initWithMainVC:(UIViewController *)MainVC andLeftVC:(UIViewController *)leftVC;

- (void)showLeftOrClosedLeft;


@end
