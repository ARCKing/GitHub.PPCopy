//
//  UILabel+QuickAttributedText.m
//  PPCopy
//
//  Created by gxtc on 2017/6/29.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "UILabel+QuickAttributedText.h"

@implementation UILabel (QuickAttributedText)

+ (UILabel *)quickLabelWithFram:(CGRect)fram
                       andTitle:(NSString *)title
                        andFont:(CGFloat)font
                  andTitleColor:(UIColor *)titleColor
             andBackGroundColor:(UIColor *)backGroundColor
               andTextAlignment:(NSTextAlignment)textAlignment{

    UILabel *titleLabel = [[UILabel alloc]initWithFrame:fram];
    titleLabel.text = title;
    titleLabel.textAlignment = textAlignment;
    titleLabel.font = [UIFont systemFontOfSize:font];
    titleLabel.textColor = titleColor;
    titleLabel.backgroundColor = backGroundColor;
    
    return titleLabel;
}



#pragma mark- 时间戳计算
+ (NSString *)LabelFinallyTime:(NSString *)yetTime{
    
    NSDate * nowDate = [NSDate date];
    
    NSTimeInterval now = [nowDate timeIntervalSince1970];
    NSTimeInterval yet = [yetTime doubleValue];
    
    //    NSLog(@"yet = %.f",yet);
    //    NSLog(@"now = %.f",now);
    
    
    NSTimeInterval newTime = now - yet;
    //    NSLog(@"new = %.f",newTime);
    
    NSString * mm = [NSString stringWithFormat:@"%.2f",newTime/60];
    NSString * hh = [NSString stringWithFormat:@"%.2f",newTime/60/60];
    NSString * dd = [NSString stringWithFormat:@"%.2f",newTime/60/60/24];
    NSString * MM = [NSString stringWithFormat:@"%.2f",newTime/60/60/24/30];
    
    
    //    NSLog(@"mm =%@",mm);
    //    NSLog(@"hh =%@",hh);
    //    NSLog(@"dd =%@",dd);
    //    NSLog(@"MM =%@",MM);
    
    NSString * date;
    
    if ([MM floatValue] >= 1) {
        
        date = [NSString stringWithFormat:@"%.f个月前",[MM floatValue]];
        
    }else if ([dd floatValue] >= 1) {
        
        date = [NSString stringWithFormat:@"%.f天前",[dd floatValue]];
        
    }else if ([hh floatValue] >= 1) {
        
        date = [NSString stringWithFormat:@"%.f小时前",[hh floatValue]];
        
    }else if ([mm floatValue] >= 1) {
        
        date = [NSString stringWithFormat:@"%.f分钟前",[mm floatValue]];
        
    }else {
        
        date = [NSString stringWithFormat:@"%.f秒前",newTime];
    }
    
    //    NSLog(@"%@",date);
    
    return date;
}



@end
