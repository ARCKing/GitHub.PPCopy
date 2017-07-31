//
//  MainNavigationView.h
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"
#import "TCN_PageControl.h"


typedef void (^MainNavigationView_changePageIndexBlock)(NSInteger);
typedef void(^MainNavigationView_ArticleClassifyBlock)(NSArray *);

@interface MainNavigationView : RootView

@property(nonatomic ,strong)UIButton * leftBt;

@property(nonatomic ,strong)UIButton * rightBt;

@property(nonatomic ,strong)TCN_PageControl * pageControl;

@property(nonatomic ,strong)UILabel * titleLabel;

@property(nonatomic ,copy)MainNavigationView_changePageIndexBlock  changePageIndexBlock;

@property(nonatomic ,copy)MainNavigationView_ArticleClassifyBlock articleClassifyBK;


@end
