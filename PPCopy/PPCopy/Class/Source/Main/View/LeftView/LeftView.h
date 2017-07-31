//
//  LeftView.h
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"
#import "LeftNavView.h"
#import "Left_LeftChannelButtonView.h"
#import "LeftChannelCollectionView.h"

@interface LeftView : RootView

@property(nonatomic,strong)LeftNavView * leftNavView;

@property(nonatomic,strong)Left_LeftChannelButtonView * left_leftChannelButton;

@property(nonatomic,strong)LeftChannelCollectionView * leftChannelCollectionView;
@end
