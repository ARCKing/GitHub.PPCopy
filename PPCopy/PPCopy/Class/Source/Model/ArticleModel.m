//
//  ArticleModel.m
//  PPCopy
//
//  Created by gxtc on 2017/7/13.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "ArticleModel.h"

@implementation ArticleModel


+(JSONKeyMapper*)keyMapper
{
    
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"id":@"_id"}];
}




+ (NSArray *)ModelStartAnalysisDataWithReapondObject:(NSArray *)respondObject{

    NSMutableArray * modelArray = [NSMutableArray new];

    if (respondObject.count > 0) {
        
        for (NSDictionary * obj in respondObject) {
        
            ArticleModel * model = [[ArticleModel alloc]initWithDictionary:obj error:nil];
        
            [modelArray addObject:model];
        }
    }
    return modelArray;
}


@end
