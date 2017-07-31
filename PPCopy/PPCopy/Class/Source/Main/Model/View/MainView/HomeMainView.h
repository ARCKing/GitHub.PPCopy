//
//  HomeMainView.h
//  PPCopy
//
//  Created by gxtc on 2017/6/29.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"
#import "MainNavigationView.h"
#import "MainCollectionView.h"
#import "CustomScrollView.h"
#import "MenuView.h"


typedef void(^HomeMainView_ScrollerViewCurrentPageBlock)(MainCollectionView *);

typedef void(^HomeMainView_addMJRefreshBlock)(MainCollectionView *);


@interface HomeMainView : RootView

@property(nonatomic,strong)MainNavigationView * mainNavView;

@property(nonatomic,strong)MainCollectionView * mainCollectionView;

@property(nonatomic,strong)CustomScrollView * scrollView;

@property(nonatomic,strong)MenuView * menuView;

@property(nonatomic,strong)HomeMainView_ScrollerViewCurrentPageBlock scrollerViewCurrnetPageBK;

@property(nonatomic,copy)HomeMainView_addMJRefreshBlock addMJRefreshBK;


@end
