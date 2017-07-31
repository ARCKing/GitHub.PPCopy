//
//  UserCenterHeadView.m
//  PPCopy
//
//  Created by gxtc on 2017/7/11.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "UserCenterHeadView.h"

@interface UserCenterHeadView()

@property(nonatomic,strong)UIButton * userIconBt;

@end

@implementation UserCenterHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = white_Color;
        
    }
    
    return self;
}


-(void)drawRect:(CGRect)rect{
    
    [self RootViewAddUI];
    
}


- (void)RootViewAddUI{

    [self addSubview:self.popBackBt];
    
    [self addSubview:self.userIconBt];

    [self addSubview:self.mineSelfDynamicBt];

    [self addSubview:self.readHestoryBt];

    [self addSubview:self.mineCoinBt];

    
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, Screen_with/2 - 5, Screen_with, 5)];
    line.backgroundColor = lightgrey_Color;
    [self addSubview:line];
    
}


- (UIButton *)popBackBt{

    if (!_popBackBt) {
        
        _popBackBt = [UIButton quickButtonWithFram:CGRectMake(5, 10, 60, 30) andTitle:nil andFont:15.0 andTitleColor:nil andBackGroundColor:white_Color andCornCornerRadius:0.0 andImageName:@"back"];
        _popBackBt.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [_popBackBt addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _popBackBt.tag = 1110;
    }
    
    return _popBackBt;
}


- (void)buttonAction:(UIButton *)bt{

    NSLog(@"%ld",bt.tag);
    
    self.headViewButtonActionBK(bt.tag);
}



- (UIButton *)userIconBt{

    if (!_userIconBt) {
        
        _userIconBt = [UIButton quickButtonWithFram:CGRectMake(Screen_with/2 - Screen_with/12, Screen_with/18, Screen_with/6, Screen_with/6) andTitle:nil andFont:15.0 andTitleColor:nil andBackGroundColor:orange_Color andCornCornerRadius:0.0 andImageName:@"back"];
        _userIconBt.layer.cornerRadius = Screen_with/12;
        _userIconBt.clipsToBounds = YES;
        
        _userIconBt.tag = 1111;
        
        [_userIconBt addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    
    return _userIconBt;
}


- (UIButton *)mineSelfDynamicBt{

    if (!_mineSelfDynamicBt) {
        
        _mineSelfDynamicBt = [UIButton quickButtonWithFram:CGRectMake(0, CGRectGetMaxY(self.userIconBt.frame), Screen_with/3, Screen_with/4) andTitle:@"我的动态" andFont:16.0 andTitleColor:darkgray_Color andBackGroundColor:white_Color andCornCornerRadius:0.0 andImageName:@"icon_dt"];
        
        [_mineSelfDynamicBt setImageEdgeInsets:UIEdgeInsetsMake(-_mineSelfDynamicBt.titleLabel.intrinsicContentSize.height, 0, 0, -_mineSelfDynamicBt.titleLabel.intrinsicContentSize.width)];
        [_mineSelfDynamicBt setTitleEdgeInsets:UIEdgeInsetsMake(_mineSelfDynamicBt.currentImage.size.height + _mineSelfDynamicBt.titleLabel.intrinsicContentSize.height, -_mineSelfDynamicBt.currentImage.size.width, 0, 0)];

        _mineSelfDynamicBt.tag = 1112;
        [_mineSelfDynamicBt addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    
    return _mineSelfDynamicBt;
}


- (UIButton *)readHestoryBt{

    if (!_readHestoryBt) {
        
        _readHestoryBt =  [UIButton quickButtonWithFram:CGRectMake(Screen_with/3, CGRectGetMaxY(self.userIconBt.frame), Screen_with/3, Screen_with/4) andTitle:@"阅读历史" andFont:16.0 andTitleColor:darkgray_Color andBackGroundColor:white_Color andCornCornerRadius:0.0 andImageName:@"icon_lh"];
        
        [_readHestoryBt setImageEdgeInsets:UIEdgeInsetsMake(-_readHestoryBt.titleLabel.intrinsicContentSize.height, 0, 0, -_readHestoryBt.titleLabel.intrinsicContentSize.width)];
        [_readHestoryBt setTitleEdgeInsets:UIEdgeInsetsMake(_readHestoryBt.currentImage.size.height + _readHestoryBt.titleLabel.intrinsicContentSize.height, -_readHestoryBt.currentImage.size.width, 0, 0)];

        _readHestoryBt.tag = 1113;
        [_readHestoryBt addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _readHestoryBt;
}


- (UIButton *)mineCoinBt{

    if (!_mineCoinBt) {
        
        _mineCoinBt = [UIButton quickButtonWithFram:CGRectMake(Screen_with*2/3, CGRectGetMaxY(self.userIconBt.frame), Screen_with/3, Screen_with/4) andTitle:@"我的海贝" andFont:16.0 andTitleColor:darkgray_Color andBackGroundColor:white_Color andCornCornerRadius:0.0 andImageName:@"icon_hb"];
        
        
        [_mineCoinBt setImageEdgeInsets:UIEdgeInsetsMake(-_mineCoinBt.titleLabel.intrinsicContentSize.height, 0, 0, -_mineCoinBt.titleLabel.intrinsicContentSize.width)];
        [_mineCoinBt setTitleEdgeInsets:UIEdgeInsetsMake(_mineCoinBt.currentImage.size.height + _mineCoinBt.titleLabel.intrinsicContentSize.height, -_mineCoinBt.currentImage.size.width, 0, 0)];
        
        _mineCoinBt.tag = 1114;
        [_mineCoinBt addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    }

    return _mineCoinBt;
}
@end
