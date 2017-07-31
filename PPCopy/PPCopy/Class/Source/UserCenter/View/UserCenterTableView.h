//
//  UserCenterTableView.h
//  PPCopy
//
//  Created by gxtc on 2017/7/11.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"


typedef void(^TableViewDidSelectWithIndexPathBlock)(NSInteger);


@interface UserCenterTableView : RootView

@property(nonatomic,strong)UserCenterHeadView * headView;

@property(nonatomic,copy)TableViewDidSelectWithIndexPathBlock tableViewDidSelectWithIndexPathBK;

@end
