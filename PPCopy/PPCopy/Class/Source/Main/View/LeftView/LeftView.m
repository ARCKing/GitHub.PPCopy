//
//  LeftView.m
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "LeftView.h"

@interface LeftView()

@end

@implementation LeftView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self RootViewAddUI];
    }


    return self;
}


-(void)RootViewAddUI{


    [self addSubview:self.leftNavView];
    [self addSubview:self.left_leftChannelButton];
    [self addSubview:self.leftChannelCollectionView];
}


-(LeftNavView *)leftNavView{


    if (!_leftNavView) {
        
        _leftNavView = [[LeftNavView alloc]initWithFrame:CGRectMake(0, 20, Screen_with, 44)];
    }

    return _leftNavView;

}

- (Left_LeftChannelButtonView *)left_leftChannelButton{

    if (!_left_leftChannelButton) {
        
        _left_leftChannelButton = [[Left_LeftChannelButtonView alloc]initWithFrame:CGRectMake(0, 64, Screen_with/6, Screen_heigh - 64)];
    }

    return _left_leftChannelButton;
}


- (LeftChannelCollectionView *)leftChannelCollectionView{

    if (!_leftChannelCollectionView) {
        
        _leftChannelCollectionView = [[LeftChannelCollectionView alloc]initWithFrame:CGRectMake(Screen_with/6, 64, Screen_with - 60 - Screen_with/6,Screen_heigh - 64)];
        _leftChannelCollectionView.backgroundColor = white_Color;
    }

    return _leftChannelCollectionView;
}

@end
