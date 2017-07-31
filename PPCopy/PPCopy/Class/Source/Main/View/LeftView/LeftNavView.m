//
//  LeftNavView.m
//  PPCopy
//
//  Created by gxtc on 2017/6/30.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "LeftNavView.h"

@implementation LeftNavView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = lightgrey_Color;
        [self RootViewAddUI];
    }
    
    
    return self;
}


-(void)RootViewAddUI{
    
    [self addSubview:self.leftSearchButton];
    [self addSubview:self.rightBaoLiaoButton];
}



- (UIButton *)leftSearchButton{
    if (!_leftSearchButton) {
        
        _leftSearchButton = [UIButton quickButtonWithFram:CGRectMake(0, 0, Screen_with/2 - 30, 44) andTitle:@"搜索" andFont:16.0 andTitleColor:RGB_color(0.0, 0.0, 0.0, 1.0) andBackGroundColor:[UIColor clearColor] andCornCornerRadius:0.0 andImageName:nil];
        
    }

    return _leftSearchButton;
}


- (UIButton *)rightBaoLiaoButton{

    if (!_rightBaoLiaoButton) {
        
        _rightBaoLiaoButton = [UIButton quickButtonWithFram:CGRectMake(Screen_with/2 -30, 0, Screen_with/2 - 30, 44) andTitle:@"报料" andFont:16.0 andTitleColor:RGB_color(0.0, 0.0, 0.0, 1.0) andBackGroundColor:[UIColor clearColor] andCornCornerRadius:0.0 andImageName:nil];

    }
    return _rightBaoLiaoButton;
}

@end
