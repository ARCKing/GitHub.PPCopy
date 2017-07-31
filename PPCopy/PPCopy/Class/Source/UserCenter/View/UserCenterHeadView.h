//
//  UserCenterHeadView.h
//  PPCopy
//
//  Created by gxtc on 2017/7/11.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"

typedef void(^UserCenterHeadViewButtonActionBlock)(NSInteger);


@interface UserCenterHeadView : RootView

/**我的动态*/
@property(nonatomic,strong)UIButton * mineSelfDynamicBt;

@property(nonatomic,strong)UIButton * readHestoryBt;

@property(nonatomic,strong)UIButton * mineCoinBt;

@property(nonatomic,strong)UIButton * popBackBt;

@property(nonatomic,copy)UserCenterHeadViewButtonActionBlock  headViewButtonActionBK;

@end
