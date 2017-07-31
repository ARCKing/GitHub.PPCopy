//
//  TCN_NavigationBarView.h
//  PPCopy
//
//  Created by gxtc on 2017/7/8.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"

@interface TCN_NavigationBarView : RootView

@property(nonatomic,strong)UIButton * popBackButton;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,copy)NSString * titleString;
@end
