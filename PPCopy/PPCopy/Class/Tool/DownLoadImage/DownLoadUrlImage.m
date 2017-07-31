//
//  DownLoadUrlImage.m
//  PPCopy
//
//  Created by gxtc on 2017/7/20.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "DownLoadUrlImage.h"

#define WEAK_SELF __typeof(self) __weak weakSelf = self;

@class DownLoadUrlImage;

static DownLoadUrlImage * downLoadImageManger;

@implementation DownLoadUrlImage



+ (instancetype)shareDownLoadImageMange{

    if (!downLoadImageManger) {
        
        downLoadImageManger = [[DownLoadUrlImage alloc]init];
    }
    
    return downLoadImageManger;

}


+ (instancetype)alloc{

    if (!downLoadImageManger) {
        
        downLoadImageManger = [super alloc];
    }

    return downLoadImageManger;
}


+ (instancetype)allocWithZone:(struct _NSZone *)zone{

    if (!downLoadImageManger) {
        
        downLoadImageManger = [ super allocWithZone:zone];
    }

    return downLoadImageManger;
}


- (id)mutableCopyWithZone:(NSZone *)zone{

    return downLoadImageManger;
}

- (id)copyWithZone:(NSZone *)zone{


    return downLoadImageManger;
}

//================================

- (void)downLoadImageWithURL:(NSString *)imageUrl complete:(DownLoadUrlImageBlock)completion{



    WEAK_SELF;
    
    SDWebImageManager * manger = [SDWebImageManager sharedManager];

    [manger.imageDownloader downloadImageWithURL:[NSURL URLWithString:imageUrl] options:SDWebImageDownloaderHighPriority progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
    
        [weakSelf downLoadImageFinish:image andComplete:completion];
        
    }];
}


- (void)downLoadImageFinish:(UIImage *)image andComplete:(DownLoadUrlImageBlock)completion{

    if (completion) completion(image);
}


@end
