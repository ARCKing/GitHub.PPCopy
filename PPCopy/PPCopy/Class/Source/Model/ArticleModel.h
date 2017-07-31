//
//  ArticleModel.h
//  PPCopy
//
//  Created by gxtc on 2017/7/13.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "JSONModel.h"

@interface ArticleModel : JSONModel

@property (nonatomic,strong)NSString<Optional> * _id;
@property (nonatomic,strong)NSString<Optional> * c_id;
@property (nonatomic,strong)NSString<Optional> * title;
@property (nonatomic,strong)NSString<Optional> * title_short;
@property (nonatomic,strong)NSString<Optional> * thumb;
@property (nonatomic,strong)NSString<Optional> * thumb1;
@property (nonatomic,strong)NSString<Optional> * thumb2;
@property (nonatomic,strong)NSString<Optional> * pic_num;

@property (nonatomic,strong)NSString<Optional> * ucshare;
@property (nonatomic,strong)NSString<Optional> * qqshare;
@property (nonatomic,strong)NSString<Optional> * share;
@property (nonatomic,strong)NSString<Optional> * detail;
@property (nonatomic,strong)NSString<Optional> * read_price;

@property (nonatomic,strong)NSString<Optional> * share_count2;
@property (nonatomic,strong)NSString<Optional> * duotu;
@property (nonatomic,strong)NSString<Optional> * height_money;
@property (nonatomic,strong)NSString<Optional> * share_count;

@property (nonatomic,strong)NSString<Optional> * abstract;
@property (nonatomic,strong)NSString<Optional> * addtime;
@property (nonatomic,strong)NSString<Optional> * video;
@property (nonatomic,strong)NSString<Optional> * view_count;
@property (nonatomic,strong)NSString<Optional> * money_count;

@property (nonatomic,strong)NSString<Optional> * media_image_url;
@property (nonatomic,strong)NSString<Optional> * media_image;
@property (nonatomic,strong)NSString<Optional> * media_id;
@property (nonatomic,strong)NSString<Optional> * media_url;


@property (nonatomic,strong)NSArray<Optional> * img;



+ (NSArray *)ModelStartAnalysisDataWithReapondObject:(NSArray *)respondObject;




@end
