//
//  RootAddPanGuesterController.h
//  PPCopy
//
//  Created by gxtc on 2017/7/7.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UMSocialCore/UMSocialCore.h>

@interface RootAddPanGuesterController : UIViewController

@property (nonatomic,strong)UIPanGestureRecognizer * panGesture;

@property(nonatomic,copy)NSString * token;
@property(nonatomic,copy)NSString * uid;
@property(nonatomic,copy)NSString * login;

@property(nonatomic,strong)NSUserDefaults * userDefault;

@property(nonatomic,strong)JsonAnalyzeManger * jsonAnalyzeManger;


- (void)RootAddPanGuesterController_popBackButtonAction;



- (void)RootAddPanGuesterController_starToShareToPlatformType:(UMSocialPlatformType)platformType
                                                    withTitle:(NSString *)title
                                               andDescription:(NSString *)description
                                                 andImage:(UIImage * )image
                                                       andUrl:(NSString *)url;






- (void)RootAddPanGuesterController_mj_RefreshData;

- (void)RootAddPanGuesterController_mj_LoadMoreData;

@end
