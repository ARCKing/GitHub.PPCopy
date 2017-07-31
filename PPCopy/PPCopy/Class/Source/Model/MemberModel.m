//
//  MemberModel.m
//  PPCopy
//
//  Created by gxtc on 2017/7/25.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "MemberModel.h"

@implementation MemberModel

+(JSONKeyMapper*)keyMapper
{
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"id":@"_id",@"new_hb":@"hb_new",@"new_jiaocheng":@"jiaochen_new",@"new_member_task":@"member_task_new"}];
}
@end
