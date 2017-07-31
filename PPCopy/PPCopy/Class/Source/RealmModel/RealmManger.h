//
//  RealmManger.h
//  PPCopy
//
//  Created by gxtc on 2017/7/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "UserInfoRealmModel.h"

@interface RealmManger : NSObject

@property(nonatomic,strong)RLMRealm * realm;

- (void)writeUserInfoToRealmWith:(MemberModel * )memberModel;

- (UserInfoRealmModel *)seekUserInfoInRealm;

/**删除某个数据*/
- (BOOL)deleteUserInfoRealmModel;

- (void)deleteAllData;
@end
