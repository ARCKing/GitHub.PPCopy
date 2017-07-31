//
//  MemberModel.h
//  PPCopy
//
//  Created by gxtc on 2017/7/25.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "JSONModel.h"
#import "Today_infoModel.h"
#import "YesterDay_infoModel.h"
#import "Invite_incomeModel.h"

@interface MemberModel : JSONModel

@property (nonatomic,strong)NSString<Optional> * _id;
@property (nonatomic,strong)NSString<Optional> * uc_id;
@property (nonatomic,strong)NSString<Optional> * integral;
@property (nonatomic,strong)NSString<Optional> * sum_money;
@property (nonatomic,strong)NSString<Optional> * residue_money;
@property (nonatomic,strong)NSString<Optional> * duobao;
@property (nonatomic,strong)NSString<Optional> * prentice_sum_money;
@property (nonatomic,strong)NSString<Optional> * openid;
@property (nonatomic,strong)NSString<Optional> * is_auth;
@property (nonatomic,strong)NSString<Optional> * is_bind;
@property (nonatomic,strong)NSString<Optional> * phone;
@property (nonatomic,strong)NSString<Optional> * nickname;
@property (nonatomic,strong)NSString<Optional> * sex;
@property (nonatomic,strong)NSString<Optional> * province;
@property (nonatomic,strong)NSString<Optional> * city;
@property (nonatomic,strong)NSString<Optional> * country;
@property (nonatomic,strong)NSString<Optional> * headimgurl;
@property (nonatomic,strong)NSString<Optional> * privilege;
@property (nonatomic,strong)NSString<Optional> * unionid;
@property (nonatomic,strong)NSString<Optional> * state;
@property (nonatomic,strong)NSString<Optional> * inputtime;
@property (nonatomic,strong)NSString<Optional> * lasttime;
@property (nonatomic,strong)NSString<Optional> * inviter;

@property (nonatomic,strong)NSString<Optional> * hb_new;
@property (nonatomic,strong)NSString<Optional> * jiaochen_new;

@property (nonatomic,strong)NSString<Optional> * ouid;
@property (nonatomic,strong)NSString<Optional> * oiv;
@property (nonatomic,strong)NSString<Optional> * is_inviter_re;
@property (nonatomic,strong)NSString<Optional> * password;
@property (nonatomic,strong)NSString<Optional> * salt;
@property (nonatomic,strong)NSString<Optional> * regip;
@property (nonatomic,strong)NSString<Optional> * address;
@property (nonatomic,strong)NSString<Optional> * industry;
@property (nonatomic,strong)NSString<Optional> * age;
@property (nonatomic,strong)NSString<Optional> * monthly_income;

@property (nonatomic,strong)NSString<Optional> * member_task_new;

@property (nonatomic,strong)NSString<Optional> * status_wake;
@property (nonatomic,strong)NSString<Optional> * is_wach;
@property (nonatomic,strong)NSString<Optional> * equipment;
@property (nonatomic,strong)NSString<Optional> * member_id;
@property (nonatomic,strong)NSString<Optional> * avatar_100;
@property (nonatomic,strong)NSString<Optional> * avatar_200;
@property (nonatomic,strong)NSString<Optional> * day;
@property (nonatomic,strong)NSString<Optional> * shoutu_url;
@property (nonatomic,strong)NSString<Optional> * app_shoutu_url;
@property (nonatomic,strong)NSString<Optional> * task_Money;

@property (nonatomic,strong)Today_infoModel<Optional> * today_info;
@property (nonatomic,strong)YesterDay_infoModel<Optional> * yesterDay_info;
@property (nonatomic,strong)Invite_incomeModel<Optional> * invite_income;

@end
