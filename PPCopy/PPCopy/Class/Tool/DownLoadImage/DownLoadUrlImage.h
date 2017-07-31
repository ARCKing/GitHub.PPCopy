//
//  DownLoadUrlImage.h
//  PPCopy
//
//  Created by gxtc on 2017/7/20.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DownLoadUrlImageBlock)(UIImage *);

@interface DownLoadUrlImage : NSObject<NSCopying,NSMutableCopying>


+ (instancetype)shareDownLoadImageMange;


- (void)downLoadImageWithURL:(NSString *)imageUrl complete:(DownLoadUrlImageBlock)completion;



@end
