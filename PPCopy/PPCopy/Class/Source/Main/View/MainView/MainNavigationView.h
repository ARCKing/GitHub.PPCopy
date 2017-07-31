//
//  MainNavigationView.h
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"
#import "TCN_PageControl.h"

@interface MainNavigationView : RootView

@property(nonatomic ,strong)UIButton * leftBt;

@property(nonatomic ,strong)UIButton * rightBt;

@property(nonatomic ,strong)TCN_PageControl * pageControl;

@property(nonatomic ,strong)UILabel * titleLabel;

@end
