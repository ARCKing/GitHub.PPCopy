//
//  WKWebController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/14.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "WKWebController.h"
#import <UMSocialCore/UMSocialCore.h>

#define WEAK_SELF __typeof(self) __weak weakSelf = self;

@interface WKWebController ()

@property(nonatomic,strong)WKWeb_View * webView;

@property(nonatomic,strong)WKWebCommentView * commentView;

@property(nonatomic,strong)WKWebShareView * shareView;

@property(nonatomic,strong)DownLoadUrlImage * downLoadImageManger;

@property(nonatomic,strong)UIImage * downLoadImage;

@end

@implementation WKWebController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [self registerForKeyBoardNotifications];
}


- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.webView];
    
    WEAK_SELF;
    [self.downLoadImageManger downLoadImageWithURL:self.articleModel.thumb complete:^(UIImage * image) {
       
        weakSelf.downLoadImage = image;
    }];
    
    [self.webView webGetArticleRequest];
}


- (DownLoadUrlImage *)downLoadImageManger{

    if (!_downLoadImageManger) {
        
        _downLoadImageManger = [DownLoadUrlImage shareDownLoadImageMange];
    }
    return _downLoadImageManger;
}

#pragma mark- 底部按钮响应
- (void)bottomViewButtonAction:(UIButton *)bt{
    
    NSLog(@"bottomViewButtonAction-底部按钮响应");
    
    if (bt.tag == 11220) {
        
        [self.view addSubview:self.commentView];
        
        [self.commentView.xxButton addTarget:self action:@selector(closedCommentViewAction) forControlEvents:UIControlEventTouchUpInside];
        [self.commentView.finishButton addTarget:self action:@selector(finishCommentAction) forControlEvents:UIControlEventTouchUpInside];

        [self.commentView.textView becomeFirstResponder];
        
    }else if (bt.tag ==11221){
        
        [self.view addSubview:self.shareView];
        
        
        [self.shareView starSpringAnimation];

        
        
    }else if (bt.tag ==11222){
        
        
    }else if (bt.tag ==11223){
        
        
    }
    
}


#pragma mark- sahreView
- (WKWebShareView *)shareView{

    if (!_shareView) {
        
        _shareView = [[WKWebShareView alloc]initWithFrame:self.view.frame];

        [_shareView addaTarget:self andSelect:@selector(shareButtonActionWithBt:)];
        
        [_shareView.XX_Button addTarget:self action:@selector(cancleShareButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }

    
    return _shareView;
}


#pragma mark-分享按钮
- (void)shareButtonActionWithBt:(UIButton *)bt{

    NSLog(@"shareButtonActionWithBt");
    /*
     UMSocialPlatformType_Sina               = 0, //新浪
     UMSocialPlatformType_WechatSession      = 1, //微信聊天
     UMSocialPlatformType_WechatTimeLine     = 2,//微信朋友圈
     UMSocialPlatformType_WechatFavorite     = 3,//微信收藏
     UMSocialPlatformType_QQ                 = 4,//QQ聊天页面
     UMSocialPlatformType_Qzone              = 5,//qq空间
     */

    
    UMSocialPlatformType platformType = UMSocialPlatformType_UnKnown;
    
    
    if (bt.tag == 11110) {
        //微信
        
        platformType = UMSocialPlatformType_WechatSession;
        
    }else if (bt.tag == 11111){
        //朋友圈
        
        platformType = UMSocialPlatformType_WechatTimeLine;

    }else if (bt.tag == 11112){
        //QQ
        platformType = UMSocialPlatformType_QQ;


    }else if (bt.tag == 11113){
        //Qzone

        platformType = UMSocialPlatformType_Qzone;

    }else if (bt.tag == 11114){
        //Sina

        platformType = UMSocialPlatformType_Sina;

    }

    
    [self RootAddPanGuesterController_starToShareToPlatformType:platformType withTitle:self.articleModel.title andDescription:self.articleModel.abstract andImage:self.downLoadImage andUrl:self.articleModel.detail];

    
    [self.shareView removeFromSuperview];
}


#pragma mark- 取消分享
- (void)cancleShareButtonAction{


    [self.shareView removeFromSuperview];
    
    for (UIButton * bt in self.shareView.btArr) {
        
        bt.frame = CGRectMake(bt.frame.origin.x, bt.frame.origin.y + Screen_with /2, Screen_with/2/5, Screen_with/2/5);
        
        NSLog(@"------=>%f",bt.frame.origin.y);
    }
    
}


#pragma mark- 取消评论
- (void)closedCommentViewAction{

    [self.commentView removeFromSuperview];
    
    self.commentView.commentBGView.frame = CGRectMake(0, Screen_heigh + Screen_with/2, Screen_with, Screen_with/2);
}


#pragma mark- 发布评论
- (void)finishCommentAction{

    [self.commentView removeFromSuperview];
    
    self.commentView.commentBGView.frame = CGRectMake(0, Screen_heigh + Screen_with/2, Screen_with, Screen_with/2);
}


- (WKWebCommentView *)commentView{
    
    if (!_commentView) {
        
        _commentView = [[WKWebCommentView alloc]initWithFrame:self.view.frame];

        WEAK_SELF;
        _commentView.closedBK = ^{
          
            [weakSelf.commentView removeFromSuperview];
            
        };
    }
    
    return _commentView;
}




- (WKWeb_View *)webView{

    if (!_webView) {
        
        _webView  = [[WKWeb_View alloc]initWithFrame:self.view.frame];
        _webView.articleModel = self.articleModel;
        
        [_webView.navBarView.popBackBt addTarget:self action:@selector(RootAddPanGuesterController_popBackButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        [self.webView.bottomView.commentBt addTarget:self action:@selector(bottomViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.webView.bottomView.shareBt addTarget:self action:@selector(bottomViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.webView.bottomView.collectBt addTarget:self action:@selector(bottomViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.webView.bottomView.dianZanBt addTarget:self action:@selector(bottomViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _webView;
}



#pragma mark- 注册键盘监听
- (void)registerForKeyBoardNotifications{

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];

}


- (void)keyboardWillShow:(NSNotification *)notification{

    NSDictionary * info = [notification userInfo];

    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    NSValue * value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGSize keyboardSize = [value CGRectValue].size;
    
    CGFloat keyboard_Heigh = keyboardSize.height;
    
    
    [UIView animateWithDuration:duration animations:^{
       
        self.commentView.commentBGView.frame = CGRectMake(0, Screen_heigh - Screen_with/2 - keyboard_Heigh, Screen_with, Screen_with/2);
        
    }];
}


- (void)keyboardWillBeHidden:(NSNotification *)notification{


}




@end
