//
//  UserCenterTableView.m
//  PPCopy
//
//  Created by gxtc on 2017/7/11.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "UserCenterTableView.h"

@interface UserCenterTableView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;

@property(nonatomic,strong)UIView * footView;

@property(nonatomic,strong)UIButton * maleButton;
@property(nonatomic,strong)UIButton * femaleButton;

@end

@implementation UserCenterTableView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = white_Color;
        
    }
    
    return self;
}


-(void)drawRect:(CGRect)rect{
    
    [self RootViewAddUI];
    
}


- (void)RootViewAddUI{
    
    [self addSubview:self.tableView];
}


-(UITableView *)tableView{

    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_with, Screen_heigh - 20) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = lightgrey_Color;
        _tableView.rowHeight = Screen_with/7;
        
        _tableView.showsVerticalScrollIndicator = NO;
        
        _tableView.tableFooterView = self.footView;
        
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSArray * titleArr = @[@"昵称",@"性别",@"手机",@"邮箱",@"地址",@"账号绑定",@"修改密码",@"地区",@"签名"];
    
    NSArray * detailArr = @[@"ace-_-ace",@"",@"15994444712",@"1111111111@qq.com",@"好好看好好看",@"",@"",@"广州",@"几时偶"];
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%ld_cell",indexPath.row]];

    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:[NSString stringWithFormat:@"%ld_cell",indexPath.row]];
    
        if (indexPath.row != 1) {
        
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }else{
        
            CGFloat xx = cell.textLabel.frame.origin.x;
            
            NSLog(@"%f",xx);
            
            self.maleButton.frame = CGRectMake(Screen_with/5, 0, Screen_with/4, Screen_with/7);
            
            self.femaleButton.frame = CGRectMake(CGRectGetMaxX(self.maleButton.frame), 0, Screen_with/4, Screen_with/7);
            [cell.contentView addSubview:self.maleButton];
            [cell.contentView addSubview:self.femaleButton];
        
        }
        
       
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.textColor = black_Color;
        cell.textLabel.font = [UIFont systemFontOfSize:18.0];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:15.0];
        cell.detailTextLabel.textColor = dimgray_Color;

    }
    
    cell.textLabel.text = titleArr[indexPath.row];
    cell.detailTextLabel.text = detailArr[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    self.tableViewDidSelectWithIndexPathBK(indexPath.row);
    
    NSLog(@"tap");
}


- (UIView *)footView{

    if (!_footView) {
        
        UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_with, 1)];
        line.backgroundColor = lightgrey_Color;
        
        _footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_with, Screen_with/6)];
        _footView.backgroundColor = white_Color;
        
        [_footView addSubview:line];
        
        [_footView addSubview:self.signOutBt];
    }
    return _footView;
}


- (UIButton *)signOutBt{

    if (!_signOutBt) {
        
        _signOutBt = [UIButton quickButtonWithFram:CGRectMake(10, Screen_with/12 - Screen_with/18, Screen_with - 20, Screen_with/9) andTitle:@"退出登录" andFont:16.0 andTitleColor:white_Color andBackGroundColor:deepskyblue_Color andCornCornerRadius:2.0 andImageName:nil];
        [_signOutBt addTarget:self action:@selector(signOutButtonAction) forControlEvents:UIControlEventTouchUpInside];

    }
    return _signOutBt;
}


- (UserCenterHeadView *)headView{

    if (!_headView) {
        
        _headView = [[UserCenterHeadView alloc]initWithFrame:CGRectMake(0, 0, Screen_with, Screen_with/2)];
    }
    
    return _headView;
}





- (void)signOutButtonAction{

    NSLog(@"signOutButtonAction");
    
    self.signOutBK();
}


- (UIButton *)maleButton{

    if (!_maleButton) {
        
        _maleButton = [UIButton quickButtonWithFram:CGRectMake(0, 0, Screen_with/4, Screen_with/7) andTitle:@"男" andFont:15.0 andTitleColor:dimgray_Color andBackGroundColor:white_Color andCornCornerRadius:0.0 andImageName:@"icon_yqg"];
        _maleButton.tag = 111;
        [_maleButton addTarget:self action:@selector(selectMaleOrFemaleAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _maleButton;
}


- (UIButton *)femaleButton{
    
    if (!_femaleButton) {
        
         _femaleButton = [UIButton quickButtonWithFram:CGRectMake(0, 0, Screen_with/4, Screen_with/7) andTitle:@"女" andFont:15.0 andTitleColor:dimgray_Color andBackGroundColor:white_Color andCornCornerRadius:0.0 andImageName:@"icon_yq"];
        _femaleButton.tag = 110;
        [_femaleButton addTarget:self action:@selector(selectMaleOrFemaleAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _femaleButton;
}


- (void)selectMaleOrFemaleAction:(UIButton *)bt{

    
    if (bt.tag == 111) {
    
        [bt setImage:[UIImage imageNamed:@"icon_yqg"] forState:UIControlStateNormal];
        [self.femaleButton setImage:[UIImage imageNamed:@"icon_yq"] forState:UIControlStateNormal];
        NSLog(@"男男");

    }else{
    
        [bt setImage:[UIImage imageNamed:@"icon_yqg"] forState:UIControlStateNormal];
        [self.maleButton setImage:[UIImage imageNamed:@"icon_yq"] forState:UIControlStateNormal];
        NSLog(@"女女");

    }
    
}


@end
