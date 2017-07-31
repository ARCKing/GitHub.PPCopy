//
//  HomeHeadScrollPage.h
//  PPCopy
//
//  Created by gxtc on 2017/7/25.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"

typedef void(^HomeHeadScrollPageBlock)(ArticleModel *);

@interface HomeHeadScrollPage : RootView

@property(nonatomic,strong)ArticleModel * model;

@property(nonatomic,copy)HomeHeadScrollPageBlock tapBK;


@property(nonatomic,strong)UIImageView * imageView;
@property(nonatomic,strong)UILabel * titleLabel;


@property(nonatomic,strong)UIImageView * timeIcon;
@property(nonatomic,strong)UILabel * timeLabel;

@property(nonatomic,strong)UIImageView * view_Icon;
@property(nonatomic,strong)UILabel * viewCountLabel;


@end
