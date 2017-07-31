//
//  UIButton+QuickCreatButtion.m
//  PPCopy
//
//  Created by gxtc on 2017/6/29.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "UIButton+QuickCreatButtion.h"

@implementation UIButton (QuickCreatButtion)

+ (UIButton * )quickButtonWithFram:(CGRect)fram andTitle:(NSString *)title andFont:(CGFloat)font andTitleColor:(UIColor *)color1 andBackGroundColor:(UIColor *)color2 andCornCornerRadius:(CGFloat )radius andImageName:(NSString *)imageName{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = fram;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color1 forState:UIControlStateNormal];
    button.backgroundColor = color2;
    button.layer.cornerRadius = radius;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    
    return button;
}


@end
