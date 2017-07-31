//
//  UILabel+QuickAttributedText.h
//  PPCopy
//
//  Created by gxtc on 2017/6/29.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (QuickAttributedText)


+ (UILabel *)quickLabelWithFram:(CGRect )fram
                       andTitle:(NSString *)title
                        andFont:(CGFloat)font
                  andTitleColor:(UIColor *)titleColor
             andBackGroundColor:(UIColor *)backGroundColor
               andTextAlignment:(NSTextAlignment)textAlignment;


#pragma mark- 时间戳计算
/**时间戳计算*/
+ (NSString *)LabelFinallyTime:(NSString *)yetTime;


@end
