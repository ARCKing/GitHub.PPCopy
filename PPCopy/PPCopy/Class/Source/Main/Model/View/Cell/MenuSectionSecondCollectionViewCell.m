//
//  MenuSectionSecondCollectionViewCell.m
//  PPCopy
//
//  Created by gxtc on 2017/7/6.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "MenuSectionSecondCollectionViewCell.h"

@implementation MenuSectionSecondCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = white_Color;
        [self addUI];
    }
    
    return self;
}


- (void)addUI{
    UIButton * bt = [UIButton quickButtonWithFram:CGRectMake(0, 0, (Screen_with - 50)/4, (Screen_with - 50)/4) andTitle:@"按钮" andFont:13.0 andTitleColor:black_Color andBackGroundColor:white_Color andCornCornerRadius:0.0 andImageName:nil];
    bt.userInteractionEnabled = NO;
    
    self.bt = bt;
    
    [self addSubview:bt];
    
}


- (void)addTitles2:(NSString *)Title andIcon:(NSString *)iconName{


    [self.bt setTitle:Title forState:UIControlStateNormal];
    [self.bt setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];

    [self.bt setImageEdgeInsets:UIEdgeInsetsMake(-self.bt.titleLabel.intrinsicContentSize.height, 0, 0, -self.bt.titleLabel.intrinsicContentSize.width)];
    [self.bt setTitleEdgeInsets:UIEdgeInsetsMake(self.bt.currentImage.size.height + self.bt.titleLabel.intrinsicContentSize.height, -self.bt.currentImage.size.width, 0, 0)];
    self.bt.userInteractionEnabled = NO;
}



@end
