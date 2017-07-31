//
//  HomeHeadScrollPage.m
//  PPCopy
//
//  Created by gxtc on 2017/7/25.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "HomeHeadScrollPage.h"

#define page_H Screen_with*4/5
#define page_W Screen_with


@interface HomeHeadScrollPage()

@property(nonatomic,strong)UITapGestureRecognizer * tapGesture;



@end

@implementation HomeHeadScrollPage

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = RGB_color(0, 0, 0, 0.6);
    }
    
    return self;
}

- (UITapGestureRecognizer *)tapGesture{

    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction)];
    }
    return _tapGesture;
}


- (void)tapGestureAction{

    NSLog(@"im tap now");
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"tap" object:self.model];
    
}


- (void)drawRect:(CGRect)rect{

    [self addGestureRecognizer:self.tapGesture];
    
    [self RootViewAddUI];
}

- (void)RootViewAddUI{

    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.timeIcon];
    [self addSubview:self.timeLabel];
    [self addSubview:self.view_Icon];
    [self addSubview:self.viewCountLabel];

}


- (UIImageView *)imageView{

    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, page_W, page_H *3/4)];
        _imageView.image = [UIImage imageNamed:@"img_loading.jpg"];
        _imageView.userInteractionEnabled = YES;
    }
    
    
    NSLog(@"%@",self.model);
    
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:self.model.thumb] placeholderImage:[UIImage imageNamed:@"img_loading.jpg"]];
    
    return _imageView;
    
}

- (UILabel *)titleLabel{

    if (!_titleLabel) {
        
        _titleLabel = [UILabel quickLabelWithFram:CGRectMake(10, page_H*3/4, Screen_with - 20, page_H/4-20) andTitle:@"loading... ..." andFont:17.0 andTitleColor:black_Color andBackGroundColor:white_Color andTextAlignment:NSTextAlignmentLeft];
        _titleLabel.numberOfLines = 0;
    }
    
    _titleLabel.text = self.model.title;
    return _titleLabel;
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
