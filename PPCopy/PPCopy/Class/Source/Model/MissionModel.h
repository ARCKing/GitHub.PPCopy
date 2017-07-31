//
//  MissionModel.h
//  PPCopy
//
//  Created by gxtc on 2017/7/25.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "JSONModel.h"

@interface MissionModel : JSONModel

@property (nonatomic,strong)NSString<Optional> * invite;
@property (nonatomic,strong)NSString<Optional> * read;
@property (nonatomic,strong)NSString<Optional> * share;
@property (nonatomic,strong)NSString<Optional> * member_task_new;

@end
