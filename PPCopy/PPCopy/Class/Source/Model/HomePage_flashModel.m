//
//  HomePage_flashModel.m
//  PPCopy
//
//  Created by gxtc on 2017/7/21.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "HomePage_flashModel.h"

@implementation HomePage_flashModel


+(JSONKeyMapper*)keyMapper
{
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"id":@"_id"}];
}
@end
