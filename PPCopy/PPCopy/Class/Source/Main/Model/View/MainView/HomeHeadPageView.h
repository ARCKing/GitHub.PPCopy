//
//  HomeHeadPageView.h
//  PPCopy
//
//  Created by gxtc on 2017/7/20.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"
#import "TCN_imagePageControl.h"

@interface HomeHeadPageView : RootView<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView * scrollView;

@property(nonatomic,strong)TCN_imagePageControl * pageControl;


#pragma mark- 获取滚动横幅数据
/**获取滚动横幅数据*/
- (void)getHomePageDataFromNet;

@end
