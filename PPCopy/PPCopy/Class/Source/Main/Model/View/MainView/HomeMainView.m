//
//  HomeMainView.m
//  PPCopy
//
//  Created by gxtc on 2017/6/29.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "HomeMainView.h"

@interface HomeMainView()<UIScrollViewDelegate>

@end

@implementation HomeMainView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor greenColor];
        
        [self addSubview:self.mainNavView];
        
        [self addSubview:self.scrollView];
        
        [self addSubview:self.menuView];
        
        [self bringSubviewToFront:self.mainNavView];
        
    }
    
    return self;
}


- (MainNavigationView *)mainNavView{
    if (!_mainNavView) {
        _mainNavView = [[MainNavigationView alloc]initWithFrame:CGRectMake(0, 0,Screen_with, 64)];
    }
    return _mainNavView;
}



- (UIScrollView *)scrollView{

    if (!_scrollView) {
        
        _scrollView = [[CustomScrollView alloc]initWithFrame:CGRectMake(0, 64, Screen_with, Screen_heigh - 64)];
        _scrollView.contentSize = CGSizeMake(Screen_with * 8, 0);
        _scrollView.showsHorizontalScrollIndicator = YES;
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;

        _scrollView.backgroundColor = [UIColor cyanColor];
        
        [_scrollView addSubview:self.mainCollectionView];
    }

    return _scrollView;
}


- (MenuView *)menuView{

    if (!_menuView) {
        
        _menuView = [[MenuView alloc]initWithFrame:CGRectMake(0, 64, Screen_with, Screen_heigh - 64)];
        _menuView.alpha = 0;
    }
    
    return _menuView;
}


- (MainCollectionView *)mainCollectionView{

    if (!_mainCollectionView) {
        _mainCollectionView = [[MainCollectionView alloc]initWithFrame:CGRectMake(0,0, Screen_with, Screen_heigh - 64)];
        
        _mainCollectionView.isAddHeadView = YES;
        _mainCollectionView.isAddSectionHeadFootView = YES;
        
//        _mainCollectionView.numberOfItemsInSection = 30;
        _mainCollectionView.numberOfSections = 1;
        _mainCollectionView.sizeForItem = CGSizeMake(Screen_with - 20, (Screen_with - 20)*2/3);
        _mainCollectionView.insetForSectionAtIndex = UIEdgeInsetsMake(10, 10, 10, 10);
        _mainCollectionView.minimumLineSpacing = 10;
        _mainCollectionView.minimumInteritemSpacing = 10;
        _mainCollectionView.cellClass = @"MainCollectionViewCell";
        _mainCollectionView.collectionViewName = @"HOME";
        _mainCollectionView.tag = 110 ;

    }
    return _mainCollectionView;
}


/**UIScrollView添加MainCollectionView*/
- (MainCollectionView *)addMainCollectionViewWithPabg:(NSInteger)page{

    MainCollectionView *mainCollectionView = [[MainCollectionView alloc]initWithFrame:CGRectMake(Screen_with * page,0, Screen_with, Screen_heigh - 64)];
    mainCollectionView.isAddHeadView = NO;
    mainCollectionView.isAddSectionHeadFootView = YES;
    
//    mainCollectionView.numberOfItemsInSection = 30;
    
    mainCollectionView.numberOfSections = 1;
    mainCollectionView.sizeForItem = CGSizeMake(Screen_with - 20, (Screen_with - 20)*2/3);
    mainCollectionView.insetForSectionAtIndex = UIEdgeInsetsMake(10, 10, 10, 10);
    mainCollectionView.minimumLineSpacing = 10;
    mainCollectionView.minimumInteritemSpacing = 10;
    mainCollectionView.cellClass = @"MainCollectionViewCell";
    mainCollectionView.collectionViewName = @"HOME";
    mainCollectionView.tag = 110 + page;
    return mainCollectionView;
    
}


#pragma mark- scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"正在滚动！");
}


//拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"将要拖动");
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

    NSLog(@"end-end-end-end-end");
    
    NSInteger page = scrollView.contentOffset.x/Screen_with;
    
    [self achiveCurrentCollectionViewWithsScrollView:scrollView Page:page];
    
}

//减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSInteger page = scrollView.contentOffset.x/Screen_with;
    
    [self achiveCurrentCollectionViewWithsScrollView:scrollView Page:page];
    
}



- (void)achiveCurrentCollectionViewWithsScrollView:(UIScrollView *)scrollView Page:(NSInteger)page{

    MainCollectionView * mainv = [scrollView viewWithTag:page + 110];
    
    if (!mainv) {
        
        mainv = [self addMainCollectionViewWithPabg:page];
        
        self.addMJRefreshBK(mainv);
        
        [scrollView addSubview:mainv];
    }
    
    self.mainNavView.changePageIndexBlock(page);
    
    self.scrollerViewCurrnetPageBK(mainv);

}




//缩放
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{}


@end
