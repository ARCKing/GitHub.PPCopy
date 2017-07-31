//
//  RootAddPanGuesterController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/7.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootAddPanGuesterController.h"

@interface RootAddPanGuesterController ()<UIGestureRecognizerDelegate>

@property(nonatomic,assign)BOOL panIsMoveRight;

@property(nonatomic,assign)BOOL panMoveEnough;

@property(nonatomic,assign)CGFloat length;

@property(nonatomic,assign)CGFloat last_x;




@end

@implementation RootAddPanGuesterController


- (NSUserDefaults *)userDefault{
    
    if (!_userDefault) {
        
        _userDefault= [NSUserDefaults standardUserDefaults];
    }
    return _userDefault;
}

- (NSString *)token{
    
    NSDictionary * dic = [NSDictionary dictionaryWithDictionary:[self.userDefault objectForKey:@"userInfo"]];
    _token = dic[key_token];
    
    return _token;
}

- (NSString *)uid{
    
    NSDictionary * dic = [NSDictionary dictionaryWithDictionary:[self.userDefault objectForKey:@"userInfo"]];
    _uid = dic[key_uid];
    
    return _uid;
}

- (NSString *)login{
    
    NSDictionary * dic = [NSDictionary dictionaryWithDictionary:[self.userDefault objectForKey:@"userInfo"]];
    _login = dic[key_login];
    return _login;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.length = 0;
    self.last_x = 0;
    
    [self.view addGestureRecognizer:self.panGesture];
    
}



- (UIPanGestureRecognizer *)panGesture{
    
    if (!_panGesture) {
        
        _panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureAction:)];
        
        [_panGesture addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:nil];
        
        _panGesture.delegate = self;
    }
    return _panGesture;
    
}

- (void)panGestureAction:(UIPanGestureRecognizer *)pan{
    
    
    // 获取手势的触摸点
    CGPoint point1 = [pan locationInView:self.view];
    
    NSLog(@"---%f---",point1.x);
    
    self.length = point1.x - self.last_x + self.length;
    
    self.last_x = point1.x;
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    CGPoint velocity = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self.view];
    
    if (velocity.x > 0 ) {
        
        self.panIsMoveRight = YES;
        
    }else{
    
        self.panIsMoveRight = NO;
    }
    
    return YES;

}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{

    
    if (self.panGesture.state == UIGestureRecognizerStateEnded) {
        
        if (self.length > 30 && self.panIsMoveRight) {
            
            
            [self.navigationController popViewControllerAnimated:YES];
        }
    }


}



- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{


    return NO;
}


- (void)dealloc{
    
    [self.panGesture removeObserver:self forKeyPath:@"state"];
    
}


- (void)RootAddPanGuesterController_popBackButtonAction{

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)RootAddPanGuesterController_mj_RefreshData{}
-(void)RootAddPanGuesterController_mj_LoadMoreData{}

- (void)RootAddPanGuesterController_starToShareToPlatformType:(UMSocialPlatformType)platformType
                        withTitle:(NSString *)title
                   andDescription:(NSString *)description
                     andImage:(UIImage * )image
                           andUrl:(NSString *)url{
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:description thumImage:image];
    //设置网页地址
    shareObject.webpageUrl =url;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                NSLog(@"response message is %@",resp.message);
                //第三方原始返回的数据
                NSLog(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                NSLog(@"response data is %@",data);
            }
        }
    }];
    
}


- (JsonAnalyzeManger *)jsonAnalyzeManger{
    
    if (!_jsonAnalyzeManger) {
        
        _jsonAnalyzeManger = [JsonAnalyzeManger shareJsonAnaylzeManger];
    }
    return _jsonAnalyzeManger;
}

@end
