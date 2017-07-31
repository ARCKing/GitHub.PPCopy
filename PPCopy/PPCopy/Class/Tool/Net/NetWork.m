//
//  NetWork.m
//  PPCopy
//
//  Created by gxtc on 2017/7/13.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "NetWork.h"


#define NET_WEAK_SELF __typeof(self) __weak weakSelf = self;

@class NetWork;

static NetWork * net;

@implementation NetWork

+ (instancetype)shareNetWork{

    if (!net) {
        
        net = [[NetWork alloc]init];
    }

    return net;
}

+ (instancetype)alloc{

    if (!net) {
        
        net = [super alloc];
    }

    return net;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{

    if (!net) {
        
        net = [super allocWithZone:zone];
    }
    
    return net;
}

- (id)copyWithZone:(NSZone *)zone{

    return net;
}

- (id)mutableCopyWithZone:(NSZone *)zone{

    return net;
}

//========================================


- (NSSet *)acceptableContentTypes
{
    if (_acceptableContentTypes == nil) {
        _acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    }
    return _acceptableContentTypes;
}


- (void)NetSendRequestWithRequesType:(NSInteger)requestType
                              andUrl:(NSString *)url
                           andParams:(NSDictionary *)params
                       andCompletion:(NetRequestCompletion)compltion{

    if (requestType == NetRequestTypeIsGet) {
        
        [self NetGetRequestWithUrl:url andParams:params andCompletion:compltion];
        
    }else if (requestType == NetRequestTypeIsPost) {
    
        [self NetPostRequestWithUrl:url andParams:params andCompletion:compltion];
    }

    
    
}


/**Post*/
- (void)NetPostRequestWithUrl:(NSString *)url
                    andParams:(NSDictionary *)params
                andCompletion:(NetRequestCompletion)compltion{

    [self NetstarUrlRequestRequesType:NetRequestTypeIsPost andUrl:url andParams:params andCompletion:compltion];
    
    
}


/**Get*/
- (void)NetGetRequestWithUrl:(NSString *)url
                    andParams:(NSDictionary *)params
                andCompletion:(NetRequestCompletion)compltion{

    [self NetstarUrlRequestRequesType:NetRequestTypeIsGet andUrl:url andParams:params andCompletion:compltion];

}



- (void)NetstarUrlRequestRequesType:(NetRequestType)requestType
                          andUrl:(NSString *)url
                    andParams:(NSDictionary *)params
                andCompletion:(NetRequestCompletion)compltion{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = self.timeoutInterval;
    
    if (self.responseSerializerType == NetResponseSerializerTypeXML) {
        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    }
    else if (self.responseSerializerType == NetResponseSerializerTypePList) {
        manager.responseSerializer = [AFPropertyListResponseSerializer serializer];
    }
    else if (self.responseSerializerType == NetResponseSerializerTypeImage) {
        manager.responseSerializer = [AFImageResponseSerializer serializer];
    }
    else if (self.responseSerializerType == NetResponseSerializerTypeCompound) {
        manager.responseSerializer = [AFCompoundResponseSerializer serializer];
    }
    else if (self.responseSerializerType == NetResponseSerializerTypeData) {
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }

    NSSet *acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromSet:self.acceptableContentTypes];
    
    manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    
    NET_WEAK_SELF
    
    if (requestType == NetRequestTypeIsPost) {
        
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf manageSessionData:responseObject error:nil completion:compltion];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
        
    }else{
    
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        [weakSelf manageSessionData:responseObject error:nil completion:compltion];

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
        
    }
    
}


- (void)manageSessionData:(id)responseObject error:(NSError *)error completion:(NetRequestCompletion)completion{

    if (completion) completion(responseObject);
        
}




@end
