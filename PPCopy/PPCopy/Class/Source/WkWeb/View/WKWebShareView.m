//
//  WKWebShareView.m
//  PPCopy
//
//  Created by gxtc on 2017/7/14.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "WKWebShareView.h"

#define bt_W_H Screen_with /2/5
#define bt_space Screen_with /2/6

@implementation WKWebShareView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = RGB_color(255.0, 255.0, 255.0, 0.95);
        
        [self addUI];
    }
    
    return self;
}


- (void)addUI{

    
    [self shareButton];
}


- (void)shareButton{

//    NSArray * btTitleArr = @[@"微信",@"朋友圈",@"QQ",@"Q空间",@"新浪微博"];
    
    NSArray * btImageArr = @[@"share_weichat",@"share_friend",@"share_qq",@"share_Qzone",@"share_sina"];
    
    self.btArr = [NSMutableArray new];
    
    for (int i = 0; i < 5; i++) {
        
        UIButton * bt = [UIButton quickButtonWithFram:CGRectMake(bt_space + (bt_W_H + bt_space)*i, Screen_heigh, bt_W_H, bt_W_H) andTitle:nil andFont:15.0 andTitleColor:lightgrey_Color andBackGroundColor:clear_Color andCornCornerRadius:0.0 andImageName:btImageArr[i]];
        
        bt.tag = 11110 + i;
        
        [self addSubview:bt];
        
        [self.btArr addObject:bt];
        
        if (i == 0) {
            
            self.weiChat_ShareButton = bt;
            
        }else if (i == 1){
        
            self.weiChat_FriendsShareButton = bt;

        }else if (i == 2){
            
            self.QQ_ShareButton = bt;

        }else if (i == 3){
            
            self.Qzone_ShareButton = bt;

        }else if (i == 4){
            
            self.sina_ShareButton = bt;

        }
        
        
    }


}



- (void)addaTarget:(id)target andSelect:(SEL)select{

    for (UIButton * bt in self.btArr) {
        
        [bt addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    }

}



- (UIButton *)XX_Button{

    if (!_XX_Button) {
        
        _XX_Button = [UIButton quickButtonWithFram:CGRectMake(0,0, bt_W_H, bt_W_H) andTitle:@"X" andFont:25.0 andTitleColor:black_Color andBackGroundColor:clear_Color andCornCornerRadius:0.0 andImageName:nil];
        _XX_Button.center = CGPointMake(Screen_with/2, Screen_heigh - bt_W_H);
        
    }
    
    return _XX_Button;
}




- (void)starSpringAnimation{


    for (int i = 0;i < 5;i++) {
        
        
        [self springAnimationWithBt:self.btArr[i] andDelayTime:0.05 * i];
        
    }

    [self addSubview:self.XX_Button];

}





- (void)springAnimationWithBt:(UIButton *)bt andDelayTime:(NSTimeInterval)time{

    [UIView animateWithDuration:2.0 delay:time usingSpringWithDamping:0.4f initialSpringVelocity:5.0f options:UIViewAnimationOptionCurveEaseIn animations:^{

        NSLog(@"<------=>%f",bt.frame.origin.y);

        bt.frame = CGRectMake(bt.frame.origin.x, bt.frame.origin.y - Screen_with/2, bt_W_H, bt_W_H);
        
        NSLog(@"<=------=>%f",bt.frame.origin.y);

        
    } completion:^(BOOL finished) {
    
        
    }];

}



@end
