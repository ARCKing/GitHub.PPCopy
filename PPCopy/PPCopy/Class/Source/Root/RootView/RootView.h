//
//  RootView.h
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonAnalyzeManger.h"

@interface RootView : UIView

@property(nonatomic,strong)JsonAnalyzeManger * jsonAnalyzeManger;

- (void)RootViewAddUI;

@end
