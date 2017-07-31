//
//  ChannelCollectionViewCell.m
//  PPCopy
//
//  Created by gxtc on 2017/7/3.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "ChannelCollectionViewCell.h"

#define bt_With (Screen_with  - Screen_with/6 - 60 - 1 )/2

@implementation ChannelCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = white_Color;
        [self addUI];
    }
    
    return self;
}


- (void)addUI{


    UIButton * bt = [UIButton quickButtonWithFram:CGRectMake(0, 0, bt_With, bt_With) andTitle:@"温度计" andFont:16.0 andTitleColor:darkgray_Color andBackGroundColor:clear_Color andCornCornerRadius:0.0 andImageName:@"HL"];
 
    [bt setImageEdgeInsets:UIEdgeInsetsMake(-bt.titleLabel.intrinsicContentSize.height, 0, 0, -bt.titleLabel.intrinsicContentSize.width)];
    [bt setTitleEdgeInsets:UIEdgeInsetsMake(bt.currentImage.size.height + bt.titleLabel.intrinsicContentSize.height, -bt.currentImage.size.width, 0, 0)];

    bt.userInteractionEnabled = NO;

    [self addSubview:bt];
    
}

@end
