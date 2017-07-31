//
//  UserInfoRealmModel.h
//  PPCopy
//
//  Created by gxtc on 2017/7/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
@interface UserInfoRealmModel : RLMObject


@property (nonatomic,strong)NSString * _id;
@property (nonatomic,strong)NSString * uc_id;
@property (nonatomic,strong)NSString * integral;
@property (nonatomic,strong)NSString * sum_money;
@property (nonatomic,strong)NSString * residue_money;
@property (nonatomic,strong)NSString * duobao;
@property (nonatomic,strong)NSString * prentice_sum_money;
@property (nonatomic,strong)NSString * openid;
@property (nonatomic,strong)NSString * is_auth;
@property (nonatomic,strong)NSString * is_bind;
@property (nonatomic,strong)NSString * phone;
@property (nonatomic,strong)NSString * nickname;
@property (nonatomic,strong)NSString * sex;
@property (nonatomic,strong)NSString * province;
@property (nonatomic,strong)NSString * city;
@property (nonatomic,strong)NSString * country;
@property (nonatomic,strong)NSString * headimgurl;
@property (nonatomic,strong)NSString * privilege;
@property (nonatomic,strong)NSString * unionid;
@property (nonatomic,strong)NSString * state;
@property (nonatomic,strong)NSString * inputtime;
@property (nonatomic,strong)NSString * lasttime;
@property (nonatomic,strong)NSString * inviter;

@property (nonatomic,strong)NSString * hb_new;
@property (nonatomic,strong)NSString * jiaochen_new;

@property (nonatomic,strong)NSString * ouid;
@property (nonatomic,strong)NSString * oiv;
@property (nonatomic,strong)NSString * is_inviter_re;
@property (nonatomic,strong)NSString * password;
@property (nonatomic,strong)NSString * salt;
@property (nonatomic,strong)NSString * regip;
@property (nonatomic,strong)NSString * address;
@property (nonatomic,strong)NSString * industry;
@property (nonatomic,strong)NSString * age;
@property (nonatomic,strong)NSString * monthly_income;

@property (nonatomic,strong)NSString * member_task_new;

@property (nonatomic,strong)NSString * status_wake;
@property (nonatomic,strong)NSString * is_wach;
@property (nonatomic,strong)NSString * equipment;
@property (nonatomic,strong)NSString * member_id;
@property (nonatomic,strong)NSString * avatar_100;
@property (nonatomic,strong)NSString * avatar_200;
@property (nonatomic,strong)NSString * day;
@property (nonatomic,strong)NSString * shoutu_url;
@property (nonatomic,strong)NSString * app_shoutu_url;
@property (nonatomic,strong)NSString * task_Money;


@property (nonatomic,strong)NSString * today_income;
@property (nonatomic,strong)NSString * today_prentice;
@property (nonatomic,strong)NSString * yesterDay_income;
@property (nonatomic,strong)NSString * invite_income_sum_;

@end

RLM_ARRAY_TYPE(UserInfoRealmModel)
