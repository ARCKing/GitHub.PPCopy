//
//  SearchController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/8.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "SearchController.h"

@interface SearchController ()

@property(nonatomic,strong)SearchView * searchView;

@end

@implementation SearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.searchView];
    
}

- (SearchView *)searchView{

    if (!_searchView) {
        
        _searchView = [[SearchView alloc]initWithFrame:self.view.frame];
        _searchView.navigationView.titleLabel.text = @"搜索";
        
        [_searchView.navigationView.popBackButton addTarget:self action:@selector(RootAddPanGuesterController_popBackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }

    return _searchView;
}



@end
