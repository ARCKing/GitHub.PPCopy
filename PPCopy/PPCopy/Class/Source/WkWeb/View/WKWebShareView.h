//
//  WKWebShareView.h
//  PPCopy
//
//  Created by gxtc on 2017/7/14.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"

@interface WKWebShareView : RootView

/** 微信朋友分享*/
@property (nonatomic,strong)UIButton * weiChat_ShareButton;
/** 微信朋友圈分享*/
@property (nonatomic,strong)UIButton * weiChat_FriendsShareButton;

@property (nonatomic,strong)UIButton * QQ_ShareButton;

@property (nonatomic,strong)UIButton * Qzone_ShareButton;

@property (nonatomic,strong)UIButton * sina_ShareButton;


@property (nonatomic,strong)UIButton * XX_Button;


@property (nonatomic,strong)NSMutableArray * btArr;

- (void)starSpringAnimation;

- (void)springAnimationWithBt:(UIButton *)bt andDelayTime:(NSTimeInterval)time;

- (void)addaTarget:(id)target andSelect:(SEL)select;

@end
