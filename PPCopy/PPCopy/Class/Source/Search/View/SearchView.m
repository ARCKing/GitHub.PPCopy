//
//  SearchView.m
//  PPCopy
//
//  Created by gxtc on 2017/7/8.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "SearchView.h"

@interface SearchView()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UISearchBarDelegate>

@property(nonatomic,strong)UITableView * tableView;

@property(nonatomic,strong)UIScrollView * scrollView;

@property(nonatomic,strong)UIView  * searchBarHeadView;

@property(nonatomic,strong)UISearchBar * searchBar;

@property(nonatomic,strong)NSMutableArray * btArr;

@property(nonatomic,strong)UIView * scrollLine;
@end

@implementation SearchView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = white_Color;
        
        self.btArr = [NSMutableArray new];
    }
    
    return self;
}


-(void)drawRect:(CGRect)rect{
    
    [self RootViewAddUI];
    
}


- (void)RootViewAddUI{

    [self addSubview:self.navigationView];
        
    [self addSubview:self.searchBarHeadView];
    
    [self addSubview:self.scrollView];
    
    [self addSubview:self.tableView];
}

- (TCN_NavigationBarView *)navigationView{
    if (!_navigationView) {
        
        _navigationView = [[TCN_NavigationBarView alloc]initWithFrame:CGRectMake(0, 20, Screen_with, 44)];

    }

    return _navigationView;
}



- (UIView *)searchBarHeadView{

    if (!_searchBarHeadView) {
        
        _searchBarHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, Screen_with, Screen_with/5)];
        _searchBarHeadView.backgroundColor = white_Color;
        [_searchBarHeadView addSubview:self.searchBar];
        
        
        NSArray * titleArr = @[@"全部",@"标题",@"正文",@"问吧"];
        
        for (NSInteger i = 0; i < 4; i++) {
            
            UIButton * bt = [UIButton quickButtonWithFram:CGRectMake(Screen_with/4 * i, Screen_with/8, Screen_with/4, Screen_with/5 - Screen_with/8 - 2) andTitle:titleArr[i] andFont:16.0 andTitleColor:lightgrey_Color andBackGroundColor:clear_Color andCornCornerRadius:0.0 andImageName:nil];
            [_searchBarHeadView addSubview:bt];
            
            [self.btArr addObject:bt];
            
            if (i == 0) {
                
                [bt setTitleColor:deepskyblue_Color forState:UIControlStateNormal];
            }
        }
        
        [_searchBarHeadView addSubview:self.scrollLine];
    }
    return _searchBarHeadView;
}


- (UIView *)scrollLine{

    if (!_scrollLine) {
        
        _scrollLine = [[UIView alloc]initWithFrame:CGRectMake((Screen_with/4 - Screen_with/8)/2, Screen_with/5 - 2, Screen_with/8,2)];
        _scrollLine.backgroundColor = deepskyblue_Color;
    }
    return _scrollLine;
}


- (UISearchBar *)searchBar{
    if (!_searchBar) {
        
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 0, Screen_with - 20, Screen_with/8)];
        _searchBar.backgroundImage = [[UIImage alloc]init];
        _searchBar.placeholder = @"输入关键字搜索";
        _searchBar.searchBarStyle = UISearchBarStyleMinimal;
        _searchBar.delegate = self;
    }


    return _searchBar;
}




- (UIScrollView *)scrollView{

    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchBarHeadView.frame), Screen_with, Screen_heigh - 64)];
        _scrollView.contentSize = CGSizeMake(Screen_with * 4, 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
    }

    return _scrollView;

}



- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchBarHeadView.frame), Screen_with, Screen_heigh - 64) style:UITableViewStylePlain];
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = Screen_with/8;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.searchBar resignFirstResponder];
    

}


#pragma mark- tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell * cell = [[UITableViewCell alloc]init];

    return cell;
}



#pragma mark- searchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

    NSLog(@"searchBarSearchButtonClicked");
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    NSLog(@"textDidChange");

}

@end
