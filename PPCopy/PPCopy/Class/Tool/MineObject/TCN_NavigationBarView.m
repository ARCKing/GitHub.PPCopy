//
//  TCN_NavigationBarView.m
//  PPCopy
//
//  Created by gxtc on 2017/7/8.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "TCN_NavigationBarView.h"

@implementation TCN_NavigationBarView

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
    
    [self addSubview:self.titleLabel];
    
    [self addSubview:self.popBackButton];
}



- (UILabel *)titleLabel{

    if (!_titleLabel) {
        
        _titleLabel = [UILabel quickLabelWithFram:CGRectMake(0, 0, Screen_with, 44) andTitle:_titleString andFont:17.0 andTitleColor:black_Color andBackGroundColor:white_Color andTextAlignment:NSTextAlignmentCenter];
    }

    return _titleLabel;

}


- (UIButton *)popBackButton{

    if (!_popBackButton) {
        
        _popBackButton = [UIButton quickButtonWithFram:CGRectMake(0, 0, 60, 44) andTitle:nil andFont:17.0 andTitleColor:clear_Color andBackGroundColor:clear_Color andCornCornerRadius:0.0 andImageName:@"back"];
        _popBackButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    }
    return _popBackButton;
}



@end
