//
//  WKWeb_View.m
//  PPCopy
//
//  Created by gxtc on 2017/7/14.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "WKWeb_View.h"

@interface WKWeb_View()<WKNavigationDelegate,WKUIDelegate>

@property(nonatomic,strong)WKWebViewConfiguration * wkConfiguration;

@property(nonatomic,strong)UIProgressView * progressView;


@end

@implementation WKWeb_View

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = white_Color;
        [self addUI];
    }
    
    return self;
}


- (void)addUI{
    
    [self addSubview:self.navBarView];
    [self addSubview:self.wkWeb];
    [self addSubview:self.bottomView];
    
    [self addSubview:self.progressView];
    
   

}






- (WKWebBottomView *)bottomView{

    if (!_bottomView) {
        
        _bottomView = [[WKWebBottomView alloc]initWithFrame:CGRectMake(0, Screen_heigh - 49, Screen_with, 49)];
    }
    return _bottomView;
}


- (WkWebNavBarView *)navBarView{

    if (!_navBarView) {
        
        _navBarView = [[WkWebNavBarView alloc]initWithFrame:CGRectMake(0, 0, Screen_with, 64)];
        _navBarView.backgroundColor = white_Color;
    }
    return _navBarView;
}


- (WKWebViewConfiguration *)wkConfiguration{

    if (!_wkConfiguration) {
        
        _wkConfiguration = [[WKWebViewConfiguration alloc]init];
//        _wkConfiguration.allowsInlineMediaPlayback = YES;
        
        
    }

    return _wkConfiguration;
}


- (WKWebView *)wkWeb{

    if (!_wkWeb) {

        _wkWeb = [[WKWebView alloc]initWithFrame:CGRectMake(0, 64, Screen_with, Screen_heigh - 64) configuration:self.wkConfiguration];
        _wkWeb.UIDelegate = self;
        _wkWeb.navigationDelegate = self;
    }
    
    return _wkWeb;
}


- (UIProgressView *)progressView{

    if (!_progressView) {
        
        _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 64, Screen_with, 1)];
        _progressView.progressTintColor = black_Color;
        _progressView.transform = CGAffineTransformMakeScale(1.0, 1.2);
        
        [self.wkWeb addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    }

    return _progressView;
}


#pragma mark- GetRequest请求
- (void)webGetArticleRequest{

    [self.wkWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleModel.detail]]];

    [self.wkWeb addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];

}


#pragma mark- 监听

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{

    if ([keyPath isEqualToString:@"title"]) {
        
        NSLog(@"%@",self.wkWeb.title);
    }else if ([keyPath isEqualToString:@"estimatedProgress"]){
    
        self.progressView.progress = self.wkWeb.estimatedProgress;
        
        if (self.progressView.progress == 1) {
            
            /*
             *添加一个简单的动画，将progressView的Height变为1.1倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.1f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
                
            }];
        
        }
    
    }else{
    
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    


}

- (void)dealloc{
    //释放监听对象
    [self.wkWeb removeObserver:self forKeyPath:@"title"];
    
    [self.wkWeb removeObserver:self forKeyPath:@"estimatedProgress"];
    
}

#pragma mark - WkWebDelegate
/**开始加载*/
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{

    //开始加载网页时展示出progressView
    self.progressView.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.2倍
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.2f);
    //防止progressView被网页挡住
    [self bringSubviewToFront:self.progressView];
}


/**加载结束*/
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{

}

@end
