//
//  WKWebCommentView.m
//  PPCopy
//
//  Created by gxtc on 2017/7/14.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "WKWebCommentView.h"

@interface WKWebCommentView()<UITextViewDelegate>

@end

@implementation WKWebCommentView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = RGB_color(0, 0, 0, 0.6);
        [self addUI];
    }
    
    return self;
}


- (void)addUI{

    [self addSubview:self.commentBGView];
}


- (UIView *)commentBGView{

    if (!_commentBGView) {
        
        _commentBGView = [[UIView alloc]initWithFrame:CGRectMake(0, Screen_heigh + Screen_with/2, Screen_with, Screen_with/2)];
        _commentBGView.backgroundColor = white_Color;
        
        [_commentBGView addSubview:self.textView];
        [_commentBGView addSubview:self.xxButton];
        [_commentBGView addSubview:self.finishButton];

    }

    return _commentBGView;
}


- (UITextView *)textView{

    if (!_textView) {
        
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(8, 10, Screen_with - 16, Screen_with/2 - 10 - Screen_with/8)];
        _textView.backgroundColor = white_Color;
        _textView.layer.borderColor = lightgrey_Color.CGColor;
        _textView.layer.borderWidth = 0.5;
        _textView.delegate = self;
        _textView.font = [UIFont systemFontOfSize:16.0];
        
        
        
    }
    return _textView;

}


-(UIButton *)xxButton{
    if (!_xxButton) {
        
        _xxButton = [UIButton quickButtonWithFram:CGRectMake(0, Screen_with/2 - Screen_with/8, Screen_with/5, Screen_with/8) andTitle:@"" andFont:17.0 andTitleColor:nil andBackGroundColor:clear_Color andCornCornerRadius:0.0 andImageName:@"icon_closed"];
    }
    
    return _xxButton;
}


- (UIButton *)finishButton{

    if (!_finishButton) {
        
        _finishButton = [UIButton quickButtonWithFram:CGRectMake(Screen_with - Screen_with/5, Screen_with/2 - Screen_with/8, Screen_with/5, Screen_with/8) andTitle:@"" andFont:17.0 andTitleColor:nil andBackGroundColor:clear_Color andCornCornerRadius:0.0 andImageName:@"icon_finish"];
    }
    
    return _finishButton;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSLog(@"touch");

    
    self.commentBGView.frame = CGRectMake(0, Screen_heigh + Screen_with/2, Screen_with, Screen_with/2);
    
    self.closedBK();
    
}




@end
