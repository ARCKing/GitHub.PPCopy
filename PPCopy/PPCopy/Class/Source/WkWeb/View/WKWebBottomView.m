//
//  WKWebBottomView.m
//  PPCopy
//
//  Created by gxtc on 2017/7/14.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "WKWebBottomView.h"

@interface WKWebBottomView()



@end

@implementation WKWebBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = white_Color;
        [self addUI];
    }
    
    return self;
}


- (void)addUI{

    NSArray * titleArr = @[@"反馈",@"分享",@"收藏",@"0"];
    
    NSArray * imgeArr = @[@"icon_comment",@"icon_share",@"icon_box_",@"icon_heat"];
    
    for (int i = 0; i < 4; i ++) {
        
        UIButton * button = [UIButton quickButtonWithFram:CGRectMake(Screen_with/4 * i,0, Screen_with/4, 49) andTitle:titleArr[i] andFont:10.0 andTitleColor:darkgray_Color andBackGroundColor:white_Color andCornCornerRadius:0.0 andImageName:imgeArr[i]];
        button.tag = 11220 + i;
        
        button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.intrinsicContentSize.height, 0, 0, -button.titleLabel.intrinsicContentSize.width);
        button.titleEdgeInsets = UIEdgeInsetsMake(button.currentImage.size.height, 0, 0, button.currentImage.size.width);
        
        [self addSubview:button];
        
        if (i == 0) {
        
            self.commentBt = button;
            
        }else if (i == 1){
        
            self.shareBt = button;
            
        }else if (i == 2){
        
            self.collectBt = button;
            
        }else{
        
            self.dianZanBt = button;
        }
        
    }
    
    
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_with, 1)];
    line.backgroundColor = lightgrey_Color;
    
    [self addSubview:line];
}

@end
