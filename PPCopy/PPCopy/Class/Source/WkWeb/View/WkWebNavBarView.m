//
//  WkWebNavBarView.m
//  PPCopy
//
//  Created by gxtc on 2017/7/14.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "WkWebNavBarView.h"

@implementation WkWebNavBarView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = white_Color;
        [self addUI];
    }
    
    return self;
}


- (void)addUI{

    [self addSubview:self.popBackBt];
    
    [self addSubview:self.viewCount];
    
    
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, 63.5, Screen_with, 0.5)];
    line.backgroundColor = lightgrey_Color;
    [self addSubview:line];
}



- (UIButton *)popBackBt{
    if (!_popBackBt) {
        
        _popBackBt = [UIButton quickButtonWithFram:CGRectMake(0, 20, 60, 44) andTitle:nil andFont:17.0 andTitleColor:nil andBackGroundColor:clear_Color andCornCornerRadius:0.0 andImageName:@"back"];
        _popBackBt.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    }

    return _popBackBt;
}


- (UIButton *)viewCount{
    if (!_viewCount) {
        
        _viewCount = [UIButton quickButtonWithFram:CGRectMake(Screen_with - 60, 20, 60, 44) andTitle:@"96" andFont:12.0 andTitleColor:deepskyblue_Color andBackGroundColor:clear_Color andCornCornerRadius:0.0 andImageName:@"icon_eye"];
        _viewCount.userInteractionEnabled = NO;
    }
    return _viewCount;
}

@end
