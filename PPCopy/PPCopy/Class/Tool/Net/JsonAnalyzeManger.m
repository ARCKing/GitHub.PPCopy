//
//  JsonAnalyzeManger.m
//  PPCopy
//
//  Created by gxtc on 2017/7/21.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "JsonAnalyzeManger.h"


#define WEAK_SELF __typeof(self) __weak weakSelf = self

@class JsonAnalyzeManger;

static JsonAnalyzeManger * jsonAnalyzeManger;

@interface JsonAnalyzeManger()

@property(nonatomic,strong)NetWork * net;

@property(nonatomic,copy)NSString * token;
@property(nonatomic,copy)NSString * uid;
@property(nonatomic,copy)NSString * login;

@property(nonatomic,strong)NSUserDefaults * userDefault;
@property(nonatomic,strong)RealmManger * realmManger;
@end

@implementation JsonAnalyzeManger



+ (instancetype)alloc{

    if (!jsonAnalyzeManger) {
        
        jsonAnalyzeManger = [super alloc];
    }

    return jsonAnalyzeManger;
}


+ (instancetype)allocWithZone:(struct _NSZone *)zone{

    if (!jsonAnalyzeManger) {
        
        jsonAnalyzeManger = [super allocWithZone:zone];
    }
    return jsonAnalyzeManger;
}


+ (instancetype)shareJsonAnaylzeManger{

    if (!jsonAnalyzeManger) {
        
        jsonAnalyzeManger = [[JsonAnalyzeManger alloc]init];
    }
    return jsonAnalyzeManger;
}

- (id)copyWithZone:(NSZone *)zone{

    return jsonAnalyzeManger;
}

- (id)mutableCopyWithZone:(NSZone *)zone{

    return jsonAnalyzeManger;
}

- (NetWork *)net{

    if (!_net) {
        
        _net = [NetWork shareNetWork];
    }
    return _net;

}


- (NSUserDefaults *)userDefault{

    if (!_userDefault) {
        
        _userDefault= [NSUserDefaults standardUserDefaults];
    }
    return _userDefault;
}

- (NSString *)token{

    
    NSDictionary * dic = [NSDictionary dictionaryWithDictionary:[self.userDefault objectForKey:@"userInfo"]];
    _token = dic[key_token];
    
    return _token;
}

- (NSString *)uid{
    
    NSDictionary * dic = [NSDictionary dictionaryWithDictionary:[self.userDefault objectForKey:@"userInfo"]];
    _uid = dic[key_uid];
    

    return _uid;
}

- (NSString *)login{

    NSDictionary * dic = [NSDictionary dictionaryWithDictionary:[self.userDefault objectForKey:@"userInfo"]];
    _login = dic[key_login];
    
    return _login;
}


- (RealmManger *)realmManger{

    if (!_realmManger) {
        
        _realmManger = [[RealmManger alloc]init];
    }
    return _realmManger;
}


//==============================================================
#pragma mark- 数据回调
/**数据回调*/
- (void)jsonDataCompleteWithCode:(NSString *)code
                         Message:(NSString *)message
                     OtherString:(NSString *)otherString
                           data1:(NSArray *)data1Array
                           data2:(NSArray *)data2Array
                             dict:(NSDictionary *)dict
                        complete:(JsonAnaylzeMangerBlock)complete{
    /*
     NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code",message,@"message",otherString,@"otherString",data1Array,@"data1Array",data2Array,@"data2Array",nil];
     */
    
    if (complete) complete(code,message,otherString,data1Array,data2Array,dict);
}

#pragma mark- 文章分类
- (void)ArticleClassifyGetFromNetWhileComplete:(JsonAnaylzeMangerBlock)complete{

    WEAK_SELF;
    self.net.responseSerializerType = NetResponseSerializerTypeJSON;//默认JSON
    [self.net NetSendRequestWithRequesType:NetRequestTypeIsGet andUrl:ArticleClassify_URL andParams:nil andCompletion:^(id responseObject) {
        
        NSString * code = [NSString stringWithFormat:@"%@",responseObject[@"code"]];
        NSString * message = [NSString stringWithFormat:@"%@",responseObject[@"message"]];
        NSArray * data = responseObject[@"data"];
        
        NSMutableArray * modelArr = [NSMutableArray new];
        
        if (data.count >0) {
            
            for (NSDictionary * dic in data) {
                
                ArticleClassifyModel * model = [[ArticleClassifyModel alloc]initWithDictionary:dic error:nil];
                
                [modelArr addObject:model];
            }

        }

        [weakSelf jsonDataCompleteWithCode:code Message:message OtherString:nil data1:modelArr data2:nil dict:nil complete:complete];

        
        
    }];


}

#pragma mark- 文章列表数据
/**文章列表数据*/
- (void)ArticleListOfClassify_id:(NSString *)classify_id andPage:(NSInteger)page andIfNeedTokenAndId:(BOOL)ifNeed complete:(JsonAnaylzeMangerBlock)complete{

    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:classify_id,@"c_id",[NSString stringWithFormat:@"%ld",page],@"pageIndex", nil];
    
    
    WEAK_SELF;
    self.net.responseSerializerType = NetResponseSerializerTypeJSON;//默认JSON
    [self.net NetSendRequestWithRequesType:NetRequestTypeIsGet andUrl:ArticleClassify_List_URL andParams:params andCompletion:^(id responseObject) {
        
        NSString * code = [NSString stringWithFormat:@"%@",responseObject[@"code"]];
        NSString * message = [NSString stringWithFormat:@"%@",responseObject[@"message"]];
        
//        NSString * otherString = [NSString stringWithFormat:@"%@",responseObject[@"message"]];

        NSArray * data = responseObject[@"data"];
        NSArray * modelArray = [ArticleModel ModelStartAnalysisDataWithReapondObject:data];
        
        [weakSelf jsonDataCompleteWithCode:code Message:message OtherString:nil data1:modelArray data2:nil dict:nil complete:complete];
        
    }];


}


#pragma mark- 首页文章-用户信息
/**首页文章-用户信息*/
- (void)HomeArticleDataAndCustomerDataIfNeedTokenAndId:(BOOL)ifNeed complete:(JsonAnaylzeMangerBlock)complete{

    
    NSDictionary * params = [NSDictionary new];
    
    if ([self.login isEqualToString:@"1"]) {
    
        NSDictionary * token_uid = [NSDictionary dictionaryWithObjectsAndKeys:self.token,key_token,self.uid,key_uid,nil];
        params = [NSDictionary dictionaryWithDictionary:token_uid];
    }

    WEAK_SELF;
    self.net.responseSerializerType = NetResponseSerializerTypeJSON;//默认JSON
    [self.net NetSendRequestWithRequesType:NetRequestTypeIsPost andUrl:Home_URL andParams:params andCompletion:^(id responseObject) {
        
        NSString * code = [NSString stringWithFormat:@"%@",responseObject[@"code"]];
        NSString * message = [NSString stringWithFormat:@"%@",responseObject[@"message"]];
        
        if ([code isEqualToString:@"1"]) {
            
            NSDictionary * data = [NSDictionary dictionaryWithDictionary:responseObject[@"data"]];

            HomePageModel * model = [[HomePageModel alloc]initWithDictionary:data error:nil];
            
            NSDictionary * dictModel = [NSDictionary dictionaryWithObjectsAndKeys:model,@"model", nil];
            
#pragma mark- 用户数据读写操作
            //用户数据读写操作
            [self userinfoWriteAndReadWithMemberData:model.member];
            
            [weakSelf jsonDataCompleteWithCode:code Message:message OtherString:nil data1:nil data2:nil dict:dictModel complete:complete];
            

        }else{
        
            [weakSelf jsonDataCompleteWithCode:code Message:message OtherString:nil data1:nil data2:nil dict:nil complete:complete];

        }
        
        
    }];

}


#pragma mark- 用户数据读写操作
- (void)userinfoWriteAndReadWithMemberData:(MemberModel *)memberModel{

    
    NSLog(@"token===--->%@",self.token);
    
    if ([self.login isEqualToString:@"1"]) {
        
        //删除旧数据
        [self.realmManger deleteAllData];

        //写入新数据
        [self.realmManger writeUserInfoToRealmWith:memberModel];

        //查询数据
        [self.realmManger seekUserInfoInRealm];

    }else{
    
        NSLog(@"未登录！");
    }


}

#pragma mark- 用户登录
/**用户登录*/
- (void)customLoginActionWithPhoneNumber:(NSString *)phone andPassword:(NSString *)password complete:(JsonAnaylzeMangerBlock)complete{

    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:phone,@"phone",password,@"password",nil];

    WEAK_SELF;
    self.net.responseSerializerType = NetResponseSerializerTypeJSON;//默认JSON
    [self.net NetSendRequestWithRequesType:NetRequestTypeIsPost andUrl:Log_In_URL andParams:params andCompletion:^(id responseObject) {
        
        NSString * code = [NSString stringWithFormat:@"%@",responseObject[@"code"]];
        NSString * message = [NSString stringWithFormat:@"%@",responseObject[@"message"]];
        
        if ([code isEqualToString:@"1"]) {
            
            NSDictionary * data = [NSDictionary dictionaryWithDictionary:responseObject[@"data"]];
            
            NSString * uid = data[@"uid"];
            NSString * token = data[@"token"];
            
            [weakSelf saveTokenAndUid:uid andToken:token andIsLogin:YES];
            
        }else{
            
            [weakSelf saveTokenAndUid:nil andToken:nil andIsLogin:NO];

        }
        
        [weakSelf jsonDataCompleteWithCode:code Message:message OtherString:nil data1:nil data2:nil dict:nil complete:complete];
        
    }];

}



#pragma mark- 写入token - uid -login-改变登录状态
/**写入token - uid -login -改变登录状态*/
- (void)saveTokenAndUid:(NSString *)uid andToken:(NSString *)token andIsLogin:(BOOL)islogin{

    NSDictionary * userInfo = [self.userDefault objectForKey:key_userInfo];
    
    NSMutableDictionary * tempDic = [NSMutableDictionary dictionaryWithDictionary:userInfo];
    
    
    if (islogin) {
        tempDic[key_token] = token;
        tempDic[key_uid] = uid;
        tempDic[key_login] = @"1";

    }else{
    
        tempDic[key_login] = @"0";

    }
    
    userInfo = [NSDictionary dictionaryWithDictionary:tempDic];
    
    [self.userDefault setObject:userInfo forKey:key_userInfo];
    
    BOOL save = [self.userDefault synchronize];
    
    if (save) {
        
        NSLog(@"保存成功");
        
    }else{
    
        NSLog(@"保存失败");
    }
}


#pragma mark- 退出登录
/**退出登录*/
- (void)customerSignOutAndComplete:(JsonAnaylzeMangerBlock)complete{

    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:self.uid,@"uid",self.token,@"token",nil];
    
    WEAK_SELF;
    self.net.responseSerializerType = NetResponseSerializerTypeJSON;//默认JSON
    [self.net NetSendRequestWithRequesType:NetRequestTypeIsPost andUrl:Log_Out_URL andParams:params andCompletion:^(id responseObject) {
        
        NSString * code = [NSString stringWithFormat:@"%@",responseObject[@"code"]];
        NSString * message = [NSString stringWithFormat:@"%@",responseObject[@"message"]];

        if ([code isEqualToString:@"1"]) {
            
            [weakSelf saveTokenAndUid:nil andToken:nil andIsLogin:NO];
        }
        
        
        [weakSelf jsonDataCompleteWithCode:code Message:message OtherString:nil data1:nil data2:nil dict:nil complete:complete];

        
    }];

}


@end
