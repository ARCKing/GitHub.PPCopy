//
//  MissionModel.m
//  PPCopy
//
//  Created by gxtc on 2017/7/25.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "MissionModel.h"

@implementation MissionModel



+(JSONKeyMapper*)keyMapper
{
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"new_member_task":@"member_task_new"}];
}

@end
