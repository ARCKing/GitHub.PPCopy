//
//  JsonAnalyzeManger.h
//  PPCopy
//
//  Created by gxtc on 2017/7/21.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JsonAnaylzeMangerBlock)(NSString * ,NSString *, NSString *,NSArray *,NSArray *,NSDictionary *);


@interface JsonAnalyzeManger : NSObject<NSCopying,NSMutableCopying>

+ (instancetype)shareJsonAnaylzeManger;


/**文章列表数据*/
- (void)ArticleListOfClassify_id:(NSString *)classify_id andPage:(NSInteger)page andIfNeedTokenAndId:(BOOL)ifNeed complete:(JsonAnaylzeMangerBlock)complete;

#pragma mark- 首页文章-用户信息
/**首页文章-用户信息*/
- (void)HomeArticleDataAndCustomerDataIfNeedTokenAndId:(BOOL)ifNeed complete:(JsonAnaylzeMangerBlock)complete;


#pragma mark- 文章分类
/**文章分类*/
- (void)ArticleClassifyGetFromNetWhileComplete:(JsonAnaylzeMangerBlock)complete;

#pragma mark- 用户登录
/**用户登录*/
- (void)customLoginActionWithPhoneNumber:(NSString *)phone andPassword:(NSString *)password complete:(JsonAnaylzeMangerBlock)complete;

#pragma mark- 退出登录
/**退出登录*/
- (void)customerSignOut;

@end
