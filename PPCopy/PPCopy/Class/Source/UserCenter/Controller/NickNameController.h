//
//  NickNameController.h
//  PPCopy
//
//  Created by gxtc on 2017/7/12.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootAddPanGuesterController.h"

@interface NickNameController : RootAddPanGuesterController

@property(nonatomic,assign)BOOL isNickName;

@property(nonatomic,assign)BOOL isLocation;

@property(nonatomic,assign)BOOL isSignName;

@property(nonatomic,strong)MainCollectionView * collectionView;

@end
