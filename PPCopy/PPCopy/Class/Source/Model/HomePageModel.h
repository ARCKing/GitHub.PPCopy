//
//  HomePageModel.h
//  PPCopy
//
//  Created by gxtc on 2017/7/21.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "JSONModel.h"
#import "MissionModel.h"
#import "MemberModel.h"
#import "HomePage_adModel.h"

@class ArticleModel;
@protocol ArticleModel
@end

@interface HomePageModel : JSONModel

@property (nonatomic,strong)HomePage_adModel<Optional> * ad;

@property (nonatomic,strong)NSString<Optional> * type;
@property (nonatomic,strong)NSString<Optional> * img_url;

@property (nonatomic,strong)NSArray<ArticleModel> * article;

@property (nonatomic,strong)MemberModel<Optional> * member;
@property (nonatomic,strong)MissionModel<Optional> * mission;


@end
