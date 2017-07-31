//
//  LeftController.h
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootController.h"

typedef void(^GoToSearchControllerBolck)(void);

typedef void(^GoToBaoLiaoControllerBolck)(void);


@interface LeftController : RootController

@property (nonatomic,strong)LeftView * leftView;

@property (nonatomic,copy)GoToSearchControllerBolck  goToSearchControllerBK;

@property (nonatomic,copy)GoToBaoLiaoControllerBolck  goToBaoLiaoControllerBK;

@end
