//
//  HomePage_adModel.h
//  PPCopy
//
//  Created by gxtc on 2017/7/21.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "JSONModel.h"
#import "HomePage_flashModel.h"

@interface HomePage_adModel : JSONModel
@property (nonatomic,strong)NSString<Optional> * baidu;
@property (nonatomic,strong)NSString<Optional> * baiduad1;
@property (nonatomic,strong)NSString<Optional> * baiduad2;
@property (nonatomic,strong)NSArray<HomePage_flashModel*><Optional> * flash;
@end
