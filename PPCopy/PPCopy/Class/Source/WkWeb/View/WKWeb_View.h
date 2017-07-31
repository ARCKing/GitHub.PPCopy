//
//  WKWeb_View.h
//  PPCopy
//
//  Created by gxtc on 2017/7/14.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"
#import <WebKit/WebKit.h>
#import "WkWebNavBarView.h"
#import "WKWebBottomView.h"

@interface WKWeb_View : RootView

@property(nonatomic,strong)WKWebView * wkWeb;

@property(nonatomic,strong)WkWebNavBarView * navBarView;

@property(nonatomic,strong)ArticleModel * articleModel;

@property(nonatomic,strong)WKWebBottomView * bottomView;

- (void)webGetArticleRequest;


@end
