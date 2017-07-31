//
//  MenuCollectionViewCell.m
//  PPCopy
//
//  Created by gxtc on 2017/7/5.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "MenuCollectionViewCell.h"

@implementation MenuCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = white_Color;
        [self addUI];
    }
    
    return self;
}


- (void)addUI{

    UILabel * label = [UILabel quickLabelWithFram:CGRectMake(0, 0, (Screen_with - 50)/4, (Screen_with - 50)/4) andTitle:@"标题" andFont:17.0 andTitleColor:white_Color andBackGroundColor:arc4_Color andTextAlignment:NSTextAlignmentCenter];
    self.bigTitle = label;
    
    
    CGFloat inch = Screen_inch;
    
    if (inch == 4.0) {
        
        label.font = [UIFont systemFontOfSize:15.0];
    }
    
    
    [self addSubview:label];
    
}


- (void)addTitles1:(NSString *)bigTitle{
    self.bigTitle.text = bigTitle;

}


@end
