//
//  UserCenterTableView.h
//  PPCopy
//
//  Created by gxtc on 2017/7/11.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"


typedef void(^TableViewDidSelectWithIndexPathBlock)(NSInteger);
typedef void(^TableViewSignOutAbuttonBlock)(void);

@interface UserCenterTableView : RootView

@property(nonatomic,strong)UserCenterHeadView * headView;
@property(nonatomic,strong)UIButton * signOutBt;

@property(nonatomic,copy)TableViewDidSelectWithIndexPathBlock tableViewDidSelectWithIndexPathBK;
@property(nonatomic,copy)TableViewSignOutAbuttonBlock signOutBK;
@end
