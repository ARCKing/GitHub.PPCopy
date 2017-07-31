//
//  WKWebCommentView.h
//  PPCopy
//
//  Created by gxtc on 2017/7/14.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"

typedef void(^ClosedCommentBlock)(void);

@interface WKWebCommentView : RootView

@property(nonatomic,strong)UIView * commentBGView;

@property(nonatomic,strong)UITextView * textView;

@property(nonatomic,strong)UIButton * xxButton;

@property(nonatomic,strong)UIButton * finishButton;

@property(nonatomic,strong)ClosedCommentBlock closedBK;

@end
