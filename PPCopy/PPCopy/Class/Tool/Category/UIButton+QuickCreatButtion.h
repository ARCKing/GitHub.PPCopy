//
//  UIButton+QuickCreatButtion.h
//  PPCopy
//
//  Created by gxtc on 2017/6/29.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (QuickCreatButtion)

+ (UIButton * )quickButtonWithFram:(CGRect)fram
                        andTitle:(NSString *)title
                         andFont:(CGFloat)font
                   andTitleColor:(UIColor *)color1
              andBackGroundColor:(UIColor *)color2
             andCornCornerRadius:(CGFloat )radius
                    andImageName:(NSString *)imageName;
@end
