//
//  UserCenterLocationCell.m
//  PPCopy
//
//  Created by gxtc on 2017/7/12.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "UserCenterLocationCell.h"

@implementation UserCenterLocationCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = white_Color;
        self.layer.borderColor = lightgrey_Color.CGColor;
        self.layer.borderWidth = 1.0;
        
        [self addUI];
    }
    
    return self;
}


- (void)addUI{
    
    UILabel * label = [UILabel quickLabelWithFram:CGRectMake(0, 0, (Screen_with - 45)/4, (Screen_with)/10) andTitle:@"标题" andFont:15.0 andTitleColor:black_Color andBackGroundColor:white_Color andTextAlignment:NSTextAlignmentCenter];
    self.bigTitle = label;
    
    [self addSubview:label];
    
}


- (void)addTitles1:(NSString *)bigTitle{
    self.bigTitle.text = bigTitle;
    
}


@end
