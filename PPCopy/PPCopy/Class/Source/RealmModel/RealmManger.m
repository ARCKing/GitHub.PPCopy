//
//  RealmManger.m
//  PPCopy
//
//  Created by gxtc on 2017/7/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RealmManger.h"

@interface RealmManger()

@property(nonatomic,strong)UserInfoRealmModel * userInfoRealmModel;
@end

@implementation RealmManger



- (RLMRealm *)realm{

    if (!_realm) {
        
        _realm = [RLMRealm defaultRealm];
        
    }
    return _realm;
}

/**存储用户数据*/
- (void)writeUserInfoToRealmWith:(MemberModel * )memberModel{

    self.userInfoRealmModel = [[UserInfoRealmModel alloc]init];
    
    self.userInfoRealmModel._id = memberModel._id;
    self.userInfoRealmModel.uc_id = memberModel.uc_id;
    self.userInfoRealmModel.integral = memberModel.integral;
    self.userInfoRealmModel.sum_money = memberModel.sum_money;
    self.userInfoRealmModel.residue_money = memberModel.residue_money;
    self.userInfoRealmModel.duobao = memberModel.duobao;
    self.userInfoRealmModel.prentice_sum_money = memberModel.prentice_sum_money;
    self.userInfoRealmModel.openid = memberModel.openid;
    self.userInfoRealmModel.is_auth = memberModel.is_auth;
    self.userInfoRealmModel.is_bind = memberModel.is_bind;
    self.userInfoRealmModel.phone = memberModel.phone;
    self.userInfoRealmModel.nickname = memberModel.nickname;
    self.userInfoRealmModel.sex = memberModel.sex;
    self.userInfoRealmModel.province = memberModel.province;
    self.userInfoRealmModel.city = memberModel.city;
    self.userInfoRealmModel.country = memberModel.country;
    self.userInfoRealmModel.headimgurl = memberModel.headimgurl;
    self.userInfoRealmModel.privilege = memberModel.privilege;
    self.userInfoRealmModel.unionid = memberModel.unionid;
    self.userInfoRealmModel.state = memberModel.state;
    self.userInfoRealmModel.inputtime = memberModel.inputtime;
    self.userInfoRealmModel.lasttime = memberModel.lasttime;
    self.userInfoRealmModel.inviter = memberModel.inviter;
    self.userInfoRealmModel.hb_new = memberModel.hb_new;
    self.userInfoRealmModel.jiaochen_new = memberModel.jiaochen_new;
    self.userInfoRealmModel.ouid = memberModel.ouid;
    self.userInfoRealmModel.oiv = memberModel.oiv;
    self.userInfoRealmModel.is_inviter_re = memberModel.is_inviter_re;
    self.userInfoRealmModel.password = memberModel.password;
    self.userInfoRealmModel.salt = memberModel.salt;
    self.userInfoRealmModel.regip = memberModel.regip;
    self.userInfoRealmModel.address = memberModel.address;
    self.userInfoRealmModel.industry = memberModel.industry;
    self.userInfoRealmModel.age = memberModel.age;
    self.userInfoRealmModel.monthly_income = memberModel.monthly_income;
    self.userInfoRealmModel.member_task_new = memberModel.member_task_new;
    self.userInfoRealmModel.status_wake = memberModel.status_wake;
    self.userInfoRealmModel.is_wach = memberModel.is_wach;
    self.userInfoRealmModel.equipment = memberModel.equipment;
    self.userInfoRealmModel.member_id = memberModel.member_id;
    self.userInfoRealmModel.avatar_100 = memberModel.avatar_100;
    self.userInfoRealmModel.avatar_200 = memberModel.avatar_200;
    self.userInfoRealmModel.day = memberModel.day;
    self.userInfoRealmModel.shoutu_url = memberModel.shoutu_url;
    self.userInfoRealmModel.app_shoutu_url = memberModel.app_shoutu_url;
    self.userInfoRealmModel.task_Money = memberModel.task_Money;
    
    self.userInfoRealmModel.today_income = memberModel.today_info.today_income;
    self.userInfoRealmModel.today_prentice = memberModel.today_info.today_prentice;
    self.userInfoRealmModel.yesterDay_income = memberModel.yesterDay_info.yesterDay_income;
    self.userInfoRealmModel.invite_income_sum_ = memberModel.invite_income.invite_income_sum_;

    
    [self realmPath];

    
    [self.realm beginWriteTransaction];

    [self.realm addObject:self.userInfoRealmModel];
    
    [self.realm commitWriteTransaction];
    
    
}



/**查询数据所有*/
- (UserInfoRealmModel *)seekUserInfoInRealm{

    //通过查询操作，Realm 将会返回包含 RLMObject 集合的RLMResults实例。RLMResults 的表现和 NSArray 十分相似，并且包含在 RLMResults 中的对象能够通过索引下标进行访问。与 NSArray 不同的是，RLMResults 需要指定类型，并且其当中只能包含RLMObject 子类类型的属性
    RLMResults * userInfo = [UserInfoRealmModel allObjects];

    NSLog(@"%@",userInfo);
    if (userInfo.count >0) {
        
        UserInfoRealmModel * userInfoRealmModel = userInfo[0];
        
        NSLog(@"%@",userInfoRealmModel);
        
        return userInfoRealmModel;

    }
    
    
    return nil;
}



/**条件查询*/
- (BOOL)deleteUserInfoRealmModel{

    RLMResults <UserInfoRealmModel *> * model = [UserInfoRealmModel objectsWhere:@"phone BEGINSWITH%@",@"1"];
    
    if (model.count > 0) {
    
        [self deleteUserInfoRealmModelWith:model[0]];
    
        return YES;
        
    }else{
    
        return NO;
    }
}


/**删除某个数据*///先查后删/
- (BOOL)deleteUserInfoRealmModelWith:(UserInfoRealmModel *)model{
    
    [self.realm beginWriteTransaction];
    
    [self.realm deleteObject:model];
    
    [self.realm commitWriteTransaction];


    return YES;
}


/**删除所有数据*/
- (void)deleteAllData{

    [self.realm beginWriteTransaction];
    
    [self.realm deleteAllObjects];
    
    [self.realm commitWriteTransaction];
}


/**数据库路劲*/
- (void)realmPath{

    RLMRealmConfiguration * configuration = [RLMRealmConfiguration defaultConfiguration];
    /**数据库路劲*/
    NSLog(@"path:%@",configuration.fileURL);
    
    /**数据库路劲*/
    NSLog(@"%@",self.realm.configuration.fileURL);
}

@end
