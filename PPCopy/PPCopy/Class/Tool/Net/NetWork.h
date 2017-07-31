//
//  NetWork.h
//  PPCopy
//
//  Created by gxtc on 2017/7/13.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, NetResponseSerializerType)
{
    NetResponseSerializerTypeData = -1,   /**< 二进制数据类型*/
    NetResponseSerializerTypeJSON = 0,    /**< 默认JSON类型*/
    NetResponseSerializerTypeXML = 1,     /**< XML类型*/
    NetResponseSerializerTypePList = 2,   /**< PList类型（预留）*/
    NetResponseSerializerTypeImage = 3,   /**< Image类型（预留）*/
    NetResponseSerializerTypeCompound = 4 /**< 组合类型（预留）*/
};


typedef void(^NetRequestCompletion)(id responseObject);

@interface NetWork : NSObject<NSCopying,NSMutableCopying>

@property (assign, nonatomic) NetResponseSerializerType responseSerializerType; /**< 响应的数据格式*/

@property (copy, nonatomic) NSSet *acceptableContentTypes; /**< 支持内容类型*/

@property (assign, nonatomic) NSTimeInterval timeoutInterval; /**< 超时时间，默认30秒*/

@property (assign, nonatomic) BOOL usingSSL; /**< 是否使用SSL（进行https请求，需要在[NetSession SecurityPolicy]方法中修改cer证书路径），默认为NO*/

+ (instancetype)shareNetWork;


- (void)NetSendRequestWithRequesType:(NSInteger)requestType
                              andUrl:(NSString *)url
                           andParams:(NSDictionary *)params
                       andCompletion:(NetRequestCompletion)compltion;
@end

