//
//  MainNavigationView.m
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "MainNavigationView.h"


#define WEAK_SELF __typeof(self) __weak weakSelf = self


@interface MainNavigationView()<UIScrollViewDelegate>

@property(nonatomic,strong)NSArray * titleArr;

@property(nonatomic,strong)JsonAnalyzeManger * manger;

@end


@implementation MainNavigationView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self getTitleArrFromNet];
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.leftBt];
        [self addSubview:self.rightBt];
        [self addSubview:self.pageControl];
        [self addSubview:self.titleLabel];
        
        __weak MainNavigationView * weakSelf = self;
        
        self.changePageIndexBlock = ^(NSInteger currentPage) {
          
            weakSelf.pageControl.currentPage = currentPage;
            
            if (weakSelf.titleArr.count > 0) {
                
                weakSelf.titleLabel.text = weakSelf.titleArr[currentPage];

            }else{
            
                NSArray * titArr = @[@"热门",@"推荐",@"段子",@"搞笑",@"猎奇",@"两性",@"生活",@"美女",@"励志"];
                
                weakSelf.titleLabel.text = titArr[currentPage];

            }
            
        };
    }

    return self;
}



/**请求文章分类*/
- (void)getTitleArrFromNet{

    WEAK_SELF;
    [self.manger ArticleClassifyGetFromNetWhileComplete:^(NSString *code, NSString *message, NSString *otherStr, NSArray *modelArr, NSArray * arr, NSDictionary *dic) {
        
        
        weakSelf.articleClassifyBK(modelArr);
        
        NSMutableArray * titleArray = [NSMutableArray new];
        
        for (ArticleClassifyModel * model in modelArr) {
            
            NSString * title = model.title;
            
            [titleArray addObject:title];
        }
        
        weakSelf.titleArr = [NSArray arrayWithArray:titleArray];
        
    }];
    
}



- (JsonAnalyzeManger *)manger{

    if (!_manger) {
        
        _manger = [JsonAnalyzeManger shareJsonAnaylzeManger];
    }
    return _manger;
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
        
        _leftBt = [UIButton quickButtonWithFram:CGRectMake(10, 20, 34, 34) andTitle:nil andFont:17.0 andTitleColor:[UIColor clearColor] andBackGroundColor:[UIColor clearColor] andCornCornerRadius:0.0 andImageName:@"JH"];
    }
    return _leftBt;
}



- (UIButton *)rightBt{

    if (!_rightBt) {
        
        _rightBt = [UIButton quickButtonWithFram:CGRectMake(Screen_with - 44, 20, 34, 34) andTitle:nil andFont:17.0 andTitleColor:[UIColor clearColor] andBackGroundColor:[UIColor clearColor] andCornCornerRadius:0.0 andImageName:@"SH"];

    }
    return _rightBt;

}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Screen_with/4, 34)];
        _titleLabel.center = CGPointMake(Screen_with/2, 37);
        _titleLabel.text = @"热门";
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
