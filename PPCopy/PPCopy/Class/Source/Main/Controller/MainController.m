//
//  MainController.m
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "MainController.h"

#define WEAK_SELF __typeof(self) __weak weakSelf = self;

@interface MainController ()

@property(nonatomic,strong)HomeMainView * homeMainView;

@property(nonatomic,strong)SliderController * slider;

@property(nonatomic,assign)BOOL isShowLeftView;

@property(nonatomic,strong)MainCollectionView * currentPageCollectionView;

/**c_id*/
@property(nonatomic,strong)NSMutableArray * articleClassify_c_id_Arr;
/**key:c_id value:data*/
@property(nonatomic,strong)NSMutableDictionary * articleClassify_c_id_data;
/**key:c_id value:page*/
@property(nonatomic,strong)NSMutableDictionary * articleClassify_c_id_page;


@end

@implementation MainController


- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //注册通知-头部滚动栏
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(headScrollTapAction:) name:@"tap" object:nil];
    
    self.view.backgroundColor = [UIColor redColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.slider = [self sliderController];
    
    [self RootControllerAddUI];
    
}



#pragma mark-文章网络请求
/**网络请求*/
- (void)getArticleListRequestWithClassify:(NSString *)classify_id andPage:(NSInteger)page andIsRefresh:(BOOL)isRefresh{
    
    
    [self.jsonAnalyzeManger ArticleListOfClassify_id:classify_id andPage:page andIfNeedTokenAndId:YES complete:^(NSString *code, NSString *message, NSString *otherString, NSArray *data1Arr, NSArray *data2Arr, NSDictionary * dict) {
        
        WEAK_SELF;
        
        if (isRefresh) {
            
            weakSelf.currentPageCollectionView.modelArray = [NSMutableArray arrayWithArray:data1Arr];

        }else{
        
            [weakSelf.currentPageCollectionView.modelArray addObjectsFromArray:data1Arr];

        }
        
        
        [weakSelf.currentPageCollectionView.collectionView reloadData];

        [weakSelf.currentPageCollectionView.collectionView.mj_header endRefreshing];
        
        [weakSelf.currentPageCollectionView.collectionView.mj_footer endRefreshing];

    }];
    

}




-(void)RootControllerAddUI{

    [self.view addSubview:self.homeMainView];

    
    WEAK_SELF;
     self.homeMainView.mainNavView.articleClassifyBK = ^(NSArray * articleClassify_cidArr) {
     
         weakSelf.articleClassify_c_id_Arr = [NSMutableArray new];
         weakSelf.articleClassify_c_id_page = [NSMutableDictionary new];
     
         for (ArticleClassifyModel * model in articleClassify_cidArr) {
     
             NSString * c_id = model.c_id;
             
             [weakSelf.articleClassify_c_id_Arr addObject:c_id];
     
             [weakSelf.articleClassify_c_id_page setObject:@"1" forKey:c_id];
     
         }
     };
    
}

- (HomeMainView *)homeMainView{

    if (!_homeMainView) {
        
        _homeMainView = [[HomeMainView alloc]initWithFrame:CGRectMake(0, 0, Screen_with, Screen_heigh)];
        
        [_homeMainView.mainNavView.leftBt addTarget:self action:@selector(RootControllerLeftNavBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_homeMainView.mainNavView.rightBt addTarget:self action:@selector(RootControllerRightNavBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_homeMainView.menuView.collecctionView.closedMenuBt addTarget:self action:@selector(RootControllerRightNavBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];

        [_homeMainView.menuView.collecctionView.loginBt addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];

        [self collectionIteamDidSelect];
        
        self.currentPageCollectionView = _homeMainView.mainCollectionView;
        
        self.homeMainView.addMJRefreshBK(self.currentPageCollectionView);
        
    }
    return _homeMainView;
}



#pragma mark- Block回调
/**Block回调*/
- (void)collectionIteamDidSelect{

    WEAK_SELF;
    self.homeMainView.mainCollectionView.DidSelectItem_ArticleModel_BK = ^(ArticleModel * model) {
    
        WKWebController * vc = [[WKWebController alloc]init];
        vc.articleModel = model;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };

    
    self.homeMainView.menuView.collecctionView.DidSelectItem_Menu_BK = ^(NSInteger row){
        

        if (row == 7) {
            MoreController * vc = [[MoreController alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:YES];

        }else if (row == 3){
            
            SystemMessageController * vc =[[SystemMessageController alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        
        }else if (row == 1){
            
            ColletcController * vc =[[ColletcController alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }

    };
    
    self.homeMainView.addMJRefreshBK = ^(MainCollectionView * collectionView) {
      
        MJRefreshNormalHeader * MJ_header = [MJRefreshNormalHeader headerWithRefreshingTarget:weakSelf refreshingAction:@selector(RootController_mj_RefreshData)];
        
        MJ_header.stateLabel.textColor =[UIColor colorWithRed:0.0 green:207.0/255.0 blue:1.0 alpha:1.0];
        
        MJ_header.lastUpdatedTimeLabel.textColor = [UIColor colorWithRed:0.0 green:207.0/255.0 blue:1.0 alpha:1.0];
        
        collectionView.collectionView.mj_header = MJ_header;
        
        
        MJRefreshAutoNormalFooter * foot = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:weakSelf refreshingAction:@selector(RootController_mj_LoadMoreData)];
        
        foot.stateLabel.hidden=YES;
        
        collectionView.collectionView.mj_footer = foot;
        
        [collectionView.collectionView.mj_header beginRefreshing];

        
        NSLog(@"TAG-----------------=====----------->%ld",collectionView.tag);
    };
    
    
    self.homeMainView.scrollerViewCurrnetPageBK = ^(MainCollectionView * collectionView) {
        
        weakSelf.currentPageCollectionView = collectionView;
        
        NSLog(@"------TAG----->%ld",collectionView.tag);
        
        
        weakSelf.currentPageCollectionView.DidSelectItem_ArticleModel_BK = ^(ArticleModel * model) {
            
            WKWebController * vc = [[WKWebController alloc]init];
            vc.articleModel = model;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        

        
    };
    
    
    
    self.homeMainView.menuView.collecctionView.DidSelectItem_Menu_BK = ^(NSInteger tag) {
        
        [weakSelf.homeMainView.scrollView setContentOffset:CGPointMake(Screen_with * tag, 0) animated:YES];
        
    };
    
    
}

- (void)headScrollTapAction:(NSNotification *)noti{


    WKWebController * vc = [[WKWebController alloc]init];
    vc.articleModel = noti.object;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)loginAction{

    if ([self.login isEqualToString:@"1"]) {
        
        UserCenterController * vc = [[UserCenterController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];

    }else{
        
        LoginController * vc = [[LoginController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}



- (void)RootControllerLeftNavBarButtonAction:(UIButton *)leftButton{

    if (!self.isShowLeftView) {
    
        self.isShowLeftView = YES;
        
        [self.slider showLeftOrClosedLeft];
        
        
    }else{
        
        self.isShowLeftView = NO;
        
        [self.slider showLeftOrClosedLeft];
        
    }
}


- (void)RootControllerRightNavBarButtonAction:(UIButton *)rightButton{
    
    if(self.homeMainView.menuView.alpha == 0){
    
    [UIView animateWithDuration:0.3 animations:^{
        
        
        self.homeMainView.menuView.collecctionView.frame = CGRectMake(0, 0, Screen_with, Screen_heigh - 164);
        
        self.homeMainView.menuView.alpha = 1;

    }];
        
    }else{
    
        [UIView animateWithDuration:0.3 animations:^{
            
            self.homeMainView.menuView.collecctionView.frame = CGRectMake(0, -Screen_heigh + 164, Screen_with, Screen_heigh - 164);

            self.homeMainView.menuView.alpha = 0;
        }];
    }
    
    
}


#pragma mark-加载更多
- (void)RootController_mj_LoadMoreData{

    NSString * c_id = [self getCurrentArticle_cid];

    NSInteger page = [self getCurrentPageWith_c_id:c_id andIsRefresh:NO];
    
    [self getArticleListRequestWithClassify:c_id andPage:page andIsRefresh:NO];

}

#pragma mark- 下拉刷新
- (void)RootController_mj_RefreshData{
    
    NSString * c_id = [self getCurrentArticle_cid];
    
    NSInteger page = [self getCurrentPageWith_c_id:c_id andIsRefresh:YES];
    
    [self getArticleListRequestWithClassify:c_id andPage:page andIsRefresh:YES];

}


- (NSString *)getCurrentArticle_cid{

    NSInteger currentTag = self.currentPageCollectionView.tag - 110;
    
    NSString * c_id = self.articleClassify_c_id_Arr[currentTag];

    return c_id;
}

- (NSInteger)getCurrentPageWith_c_id:(NSString *)c_id andIsRefresh:(BOOL)isRefresh{

    NSString * pageStr = [self.articleClassify_c_id_page objectForKey:c_id];

    NSInteger page = 1;
    
    if (isRefresh) {
    
        [self.articleClassify_c_id_page setValue:@"1" forKey:c_id];
        
    }else{
    
        page = [pageStr integerValue] + 1;
        
        [self.articleClassify_c_id_page setObject:[NSString stringWithFormat:@"%ld",page] forKey:c_id];

    }
    
    return page;
}

- (void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
