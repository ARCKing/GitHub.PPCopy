//
//  MenuView.m
//  PPCopy
//
//  Created by gxtc on 2017/7/5.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "MenuView.h"

@interface MenuView()


@end

@implementation MenuView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = RGB_color(0, 0, 0, 0.6);
    }
    
    return self;
}


-(void)drawRect:(CGRect)rect{
    
    [self RootViewAddUI];

}


- (void)RootViewAddUI{


    [self addSubview:self.collecctionView];
}


- (MainCollectionView *)collecctionView{

    if (!_collecctionView) {
        
        _collecctionView = [[MainCollectionView alloc]initWithFrame:CGRectMake(0,-Screen_with +Screen_heigh/4, Screen_with, Screen_heigh - Screen_heigh/4)];
        _collecctionView.isAddSectionHeadFootView = YES;
        _collecctionView.numberOfSections = 2;
        _collecctionView.numberOfItemsInSection = 8;
        _collecctionView.sizeForItem = CGSizeMake((Screen_with - 50)/4, (Screen_with - 50)/4);
        _collecctionView.insetForSectionAtIndex = UIEdgeInsetsMake(10, 10, 10, 10);
        _collecctionView.minimumInteritemSpacing = 10;
        _collecctionView.minimumLineSpacing = 10;
        
        _collecctionView.cellClass = @"MenuCollectionViewCell";
        _collecctionView.cellClassSecond = @"MenuSectionSecondCollectionViewCell";
        
        _collecctionView.collectionViewName = @"Menu";
        _collecctionView.collectionView.backgroundColor = white_Color;
        
        
        
        _collecctionView.titleArray1 = @[@"澎湃",@"视频",@"时事",@"财经",@"思想",@"生活",@"问吧",@"我的订阅"];
        
        _collecctionView.titleArray2 = @[@"跟踪",@"收藏",@"话题",@"消息",@"系统字体",@"夜间模式",@"海贝商城",@"更多"];
        _collecctionView.titleIconArray2 = @[@"icon_WYJ",@"icon_SC",@"icon_W",@"icon_XX",@"icon_ZT",@"icon_YL",@"icon_BK",@"icon_CL"];

        
    }
    return _collecctionView;
}

@end
