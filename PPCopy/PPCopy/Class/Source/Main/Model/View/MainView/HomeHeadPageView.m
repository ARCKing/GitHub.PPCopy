//
//  HomeHeadPageView.m
//  PPCopy
//
//  Created by gxtc on 2017/7/20.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "HomeHeadPageView.h"

#define WEAK_SELF __typeof(self) __weak weakSelf = self

@interface HomeHeadPageView()

@property(nonatomic,strong) NSArray * articleModelArr;

@property(nonatomic,strong)HomeHeadScrollPage * pageV;

@end

@implementation HomeHeadPageView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = RGB_color(0, 0, 0, 0.6);
    }
    
    return self;
}


#pragma mark- 获取滚动横幅数据
- (void)getHomePageDataFromNet{

    WEAK_SELF;
    
    [self.jsonAnalyzeManger HomeArticleDataAndCustomerDataIfNeedTokenAndId:YES complete:^(NSString *code, NSString *message, NSString * otherStr, NSArray * arr1, NSArray *arr2, NSDictionary * dict) {
        
        HomePageModel * model = dict[@"model"];
                
        weakSelf.articleModelArr = [NSArray arrayWithArray:model.article];
        
        
        [weakSelf RootViewAddUI];
    }];

}




-(void)drawRect:(CGRect)rect{
    
    [self getHomePageDataFromNet];
}



- (void)RootViewAddUI{

    [self addSubview:self.scrollView];

    [self addSubview:self.pageControl];

    
    for (int i = 0; i < self.articleModelArr.count; i++) {
        
        HomeHeadScrollPage * page = [self addPageVforPage:i];
        [self.scrollView addSubview:page];
    }

}


- (HomeHeadScrollPage*)addPageVforPage:(NSInteger)index{

    HomeHeadScrollPage * page = [[HomeHeadScrollPage alloc]initWithFrame:CGRectMake(Screen_with * index, 0, Screen_with, Screen_with*4/5)];
    page.model = self.articleModelArr[index];
    
    page.backgroundColor = [UIColor whiteColor];
    page.tag = 900+index;
    return page;
}



- (UIScrollView *)scrollView{

    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Screen_with, Screen_with*4/5)];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor redColor];
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }

    _scrollView.contentSize = CGSizeMake(Screen_with*self.articleModelArr.count,0);

    return _scrollView;
}


- (TCN_imagePageControl *)pageControl{

    if (!_pageControl) {
        
        _pageControl = [[TCN_imagePageControl alloc]initWithFrame:CGRectMake(0, 0, 1, 1)];
        
        _pageControl.currentPage = 0;
        
        _pageControl.center = CGPointMake(Screen_with/2, Screen_with*8/15);
        
        [_pageControl setValue:[UIImage imageNamed:@"icon_page"] forKey:@"_currentPageImage"];
        
        [_pageControl setValue:[UIImage imageNamed:@"icon_page_nor"] forKey:@"_pageImage"];
    }

    _pageControl.numberOfPages = self.articleModelArr.count;

    return _pageControl;
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSInteger currentPage = scrollView.contentOffset.x/Screen_with;

    self.pageControl.currentPage = currentPage;
}

@end
