//
//  Left_LeftChannelButtonView.m
//  PPCopy
//
//  Created by gxtc on 2017/6/30.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "Left_LeftChannelButtonView.h"

#define button_Height (Screen_heigh - 64)/7

@implementation Left_LeftChannelButtonView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = white_Color;
        [self RootViewAddUI];
    }
    
    
    return self;
}


-(void)RootViewAddUI{

    [self addChannelButton];
    
    [self addSubview:self.selectLineCube];
}


-(UIView *)selectLineCube{

    if (!_selectLineCube) {
        
        
        UIView * backGround = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width - 5, 0, 5, Screen_heigh - 64)];
        backGround.backgroundColor = lightgrey_Color;
        [self addSubview:backGround];
        
        _selectLineCube = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width - 5, 0, 5, button_Height)];
        _selectLineCube.backgroundColor = [UIColor redColor];
    }

    return _selectLineCube;
}

-(void)addChannelButton{
    
    NSArray * title = @[@"视频",@"时事",@"财经",@"思想",@"生活",@"问吧",@"订阅"];
    NSMutableArray * btArray = [NSMutableArray new];
    
    for (NSInteger i = 0 ;i < 7;i++) {
        
        UIButton * bt = [UIButton quickButtonWithFram:CGRectMake((self.frame.size.width - 5)/3, button_Height * i, (self.frame.size.width - 5)/3, button_Height) andTitle:title[i] andFont:20.0 andTitleColor:dimgray_Color andBackGroundColor:white_Color andCornCornerRadius:0.0 andImageName:nil];
        bt.tag = 111110 + i;
        [bt.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [bt.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [btArray addObject:bt];
        
        [self addSubview:bt];
    }
    
    self.channelButtonArray = [NSArray arrayWithArray:btArray];
}


@end
