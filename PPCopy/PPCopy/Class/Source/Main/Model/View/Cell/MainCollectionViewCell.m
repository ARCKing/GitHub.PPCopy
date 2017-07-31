//
//  MainCollectionViewCell.m
//  PPCopy
//
//  Created by gxtc on 2017/7/3.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "MainCollectionViewCell.h"

@interface MainCollectionViewCell()

@property(nonatomic,strong)UIImageView * imageView;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIButton * littleBt;


@property(nonatomic,strong)UIImageView * timeIcon;
@property(nonatomic,strong)UILabel * timeLabel;

@property(nonatomic,strong)UIImageView * view_Icon;
@property(nonatomic,strong)UILabel * viewCountLabel;


@end

@implementation MainCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = white_Color;
        [self addUI];
    }
    
    return self;
}



- (void)setArticleModel:(ArticleModel *)articleModel{

    [self.imageView sd_setImageWithURL:[NSURL URLWithString:articleModel.thumb] placeholderImage:[UIImage imageNamed:@"img_loading.jpg"]];
    
    self.titleLabel.text = articleModel.title;
    
    self.timeLabel.text = [UILabel LabelFinallyTime:articleModel.addtime];
    
    self.viewCountLabel.text = articleModel.view_count;
}



- (void)addUI{


    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img_loading.jpg"]];
    imageView.frame = CGRectMake(0, 0, Screen_with - 20, (Screen_with - 20)*4/9);
    [self addSubview:imageView];
    self.imageView = imageView;
    
    UILabel * titleLabel = [UILabel quickLabelWithFram:CGRectMake(5, CGRectGetMaxY(imageView.frame), Screen_with - 30, Screen_with/7) andTitle:@"辽宁舰编队跨区机动训练:到达某海域百余个战位进入战斗状态" andFont:17.0 andTitleColor:black_Color andBackGroundColor:white_Color andTextAlignment:NSTextAlignmentLeft];
    titleLabel.numberOfLines = 0;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    [self addSubview:self.timeIcon];
    [self addSubview:self.timeLabel];
    [self addSubview:self.view_Icon];
    [self addSubview:self.viewCountLabel];

}



- (UIImageView *)timeIcon{
    
    if (!_timeIcon) {
        
        _timeIcon = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame), 18, 18)];
        _timeIcon.image = [UIImage imageNamed:@"icon_time"];
        _timeIcon.userInteractionEnabled = YES;
    }
    
    return _timeIcon;
}

- (UILabel *)timeLabel{
    
    if (!_timeLabel) {
        
        _timeLabel = [UILabel quickLabelWithFram:CGRectMake(CGRectGetMaxX(self.timeIcon.frame) + 3, CGRectGetMaxY(self.titleLabel.frame), Screen_with/6,20) andTitle:@"45分钟前" andFont:11.0 andTitleColor:black_Color andBackGroundColor:white_Color andTextAlignment:NSTextAlignmentLeft];
    }
    return _timeLabel;
}


- (UIImageView *)view_Icon{
    
    if (!_view_Icon) {
        
        _view_Icon = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.timeLabel.frame) + 3, CGRectGetMaxY(self.titleLabel.frame), 18, 18)];
        _view_Icon.image = [UIImage imageNamed:@"icon_eyes"];
        _view_Icon.userInteractionEnabled = YES;
    }
    
    return _view_Icon;
}


- (UILabel *)viewCountLabel{
    
    if (!_viewCountLabel) {
        
        _viewCountLabel = [UILabel quickLabelWithFram:CGRectMake(CGRectGetMaxX(self.view_Icon.frame) + 3, CGRectGetMaxY(self.titleLabel.frame), Screen_with/6,20) andTitle:@"196" andFont:11.0 andTitleColor:black_Color andBackGroundColor:white_Color andTextAlignment:NSTextAlignmentLeft];
    }
    return _viewCountLabel;
}


@end
