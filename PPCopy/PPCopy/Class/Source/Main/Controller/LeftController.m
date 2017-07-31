//
//  LeftController.m
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "LeftController.h"

@interface LeftController ()
@end

@implementation LeftController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self RootControllerAddUI];
}

- (void)RootControllerAddUI{

    [self.view addSubview:self.leftView];
    
}

-(LeftView *)leftView{

    if (!_leftView) {
        
        _leftView = [[LeftView alloc]initWithFrame:self.view.bounds];
        
        [_leftView.leftNavView.leftSearchButton addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
        
        [_leftView.leftNavView.rightBaoLiaoButton addTarget:self action:@selector(baoLiaoAction) forControlEvents:UIControlEventTouchUpInside];

    }

    return _leftView;
}



- (void)searchAction{
    
    self.goToSearchControllerBK();
}


- (void)baoLiaoAction{
    
    NSLog(@"baoLiaoAction");
    
    self.goToBaoLiaoControllerBK();
    
}

@end
