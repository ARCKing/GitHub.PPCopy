//
//  HomeMainView.m
//  PPCopy
//
//  Created by gxtc on 2017/6/29.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "HomeMainView.h"

@implementation HomeMainView



- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor greenColor];
        
        [self addSubview:self.mainNavView];
    }
    
    return self;
}


- (MainNavigationView *)mainNavView{
    if (!_mainNavView) {
        _mainNavView = [[MainNavigationView alloc]initWithFrame:CGRectMake(0, 0,Screen_with, 64)];
    }
    return _mainNavView;
}



@end
