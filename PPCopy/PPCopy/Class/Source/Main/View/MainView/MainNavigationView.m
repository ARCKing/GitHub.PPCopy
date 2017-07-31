//
//  MainNavigationView.m
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "MainNavigationView.h"

@interface MainNavigationView()<UIScrollViewDelegate>


@end


@implementation MainNavigationView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.leftBt];
        [self addSubview:self.rightBt];
        [self addSubview:self.pageControl];
        [self addSubview:self.titleLabel];
        
    }

    return self;
}


-(UIPageControl *)pageControl{

    if (!_pageControl) {
        
        _pageControl = [[TCN_PageControl alloc]initWithFrame:CGRectMake(0, 0, Screen_with/2, 0)];
        _pageControl.center = CGPointMake(Screen_with/2, 54);
        _pageControl.numberOfPages = 8;
        _pageControl.currentPage = 0;
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    }

    return _pageControl;
}


- (UIButton *)leftBt{

    if (!_leftBt) {
        
        _leftBt = [UIButton quickButtonWithFram:CGRectMake(10, 20, 34, 34) andTitle:nil andFont:17.0 andTitleColor:[UIColor clearColor] andBackGroundColor:[UIColor orangeColor] andCornCornerRadius:0.0 andImageName:nil];
    }
    return _leftBt;
}



- (UIButton *)rightBt{

    if (!_rightBt) {
        
        _rightBt = [UIButton quickButtonWithFram:CGRectMake(Screen_with - 44, 20, 34, 34) andTitle:nil andFont:17.0 andTitleColor:[UIColor clearColor] andBackGroundColor:[UIColor orangeColor] andCornCornerRadius:0.0 andImageName:nil];

    }
    return _rightBt;

}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Screen_with/4, 34)];
        _titleLabel.center = CGPointMake(Screen_with/2, 37);
        _titleLabel.text = @"澎湃King";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:17.0];
    }

    return _titleLabel;
}

#pragma scrollView delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

}

@end
