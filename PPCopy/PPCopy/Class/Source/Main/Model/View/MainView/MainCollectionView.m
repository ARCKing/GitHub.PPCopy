//
//  MainCollectionView.m
//  PPCopy
//
//  Created by gxtc on 2017/7/3.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "MainCollectionView.h"

#define cell_With (Screen_with  - 20)
#define cell_height (Screen_with  - 20)*2/3


@interface MainCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation MainCollectionView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}



- (void)drawRect:(CGRect)rect{

    [self RootViewAddUI];

}



-(void)RootViewAddUI{
    
    [self addSubview:self.collectionView];
}


- (UICollectionView *)collectionView{
    
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        /*
        //DecorationView装饰视图，是我们在自定义Custom Layout时使用
        [flowLayout registerClass:[Custom class] forDecorationViewOfKind:@"DecorationView"];
        [flowLayout registerClass:[Custom class] forDecorationViewOfKind:@"DecorationView"];
        */
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:NSClassFromString(self.cellClass) forCellWithReuseIdentifier:@"UICollectionViewCell1"];
        
        
        
        if (self.cellClassSecond) {
            [_collectionView registerClass:NSClassFromString(self.cellClassSecond) forCellWithReuseIdentifier:@"UICollectionViewCell2"];
            
        }
        
        
        [_collectionView registerClass:[UICollectionViewCell class]forCellWithReuseIdentifier:@"EmptyCell"];

        
        _collectionView.backgroundColor = gainsboro_Color;
        
        
        
        //总是有弹簧效果
//        _collectionView.alwaysBounceVertical = YES;
        
        
        if (_isAddHeadView) {
            
            _collectionView.contentInset = UIEdgeInsetsMake(Screen_with *4/5, 0, 0, 0);
            [_collectionView addSubview:self.headView];
        }
        
        
        if (_isAddSectionHeadFootView) {
            
            flowLayout.headerReferenceSize = CGSizeMake(Screen_with, Screen_with /7);
            
            flowLayout.footerReferenceSize = CGSizeMake(Screen_with, Screen_with /7);

            
            [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeadView"];

            [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"sectionFootView"];

            
        }
        
        
        
    }
    
    return _collectionView;
    
}


- (HomeHeadPageView *)headView{

    if (!_headView) {
        
        _headView = [[HomeHeadPageView alloc]initWithFrame:CGRectMake(0, -Screen_with*4/5, Screen_with, Screen_with*4/5)];
        _headView.backgroundColor = [UIColor blueColor];
    }

    return _headView;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * reuseIdentifier1 = @"UICollectionViewCell1";
    static NSString * reuseIdentifier2 = @"UICollectionViewCell2";

    if (indexPath.section == 0) {
        
        self.cell1 =  [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier1 forIndexPath:indexPath];

        
        for (UIView * subView in self.cell1.contentView.subviews) {
            [subView removeFromSuperview];
        }
        
        
        
        if ([self.cellClass isEqualToString:@"MainCollectionViewCell"]) {
            
            NSLog(@"%ld",indexPath.row);
            
            self.cell1.articleModel = self.modelArray[indexPath.row];
            
            
        }else if ([self.cellClass isEqualToString:@"MenuCollectionViewCell"]){
            
            [self.cell1 addTitles1:self.titleArray1[indexPath.row]];
            
        }else if ([self.cellClass isEqualToString:@"UserCenterLocationCell"]){
            
            [self.cell1 addTitles1:self.titleArray1[indexPath.row]];
        }

        
        return self.cell1;

    }else if (indexPath.section == 1){
        
        self.cell2 = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier2 forIndexPath:indexPath];
        
        for (UIView * subView in self.cell2.contentView.subviews) {
            [subView removeFromSuperview];
        }
    
        if ([self.cellClassSecond isEqualToString:@"MenuSectionSecondCollectionViewCell"]) {
        
            [self.cell2 addTitles2:self.titleArray2[indexPath.row] andIcon:self.titleIconArray2[indexPath.row]];
        }
        
        

        return self.cell2;
        
    }else{
    
        UICollectionViewCell * cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"EmptyCell" forIndexPath:indexPath];
        
        for (UIView * subView in cell.contentView.subviews) {
            [subView removeFromSuperview];
        }
        
        return cell;
    }
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSLog(@"我点击首页-%@",self.collectionViewName);
    
    if ([self.cellClass isEqualToString:@"MenuCollectionViewCell"]) {

        
        
        if(indexPath.section == 0){
        
            self.DidSelectItem_Menu_BK(indexPath.row);
        
        }
        
        
        
        if (indexPath.section == 1 && indexPath.row == 7) {
            
            self.DidSelectItem_Menu_BK(indexPath.row);
            
        }else if (indexPath.section == 1 && indexPath.row == 3) {
            
            self.DidSelectItem_Menu_BK(indexPath.row);
        }else if (indexPath.section == 1 && indexPath.row == 1) {
            
            self.DidSelectItem_Menu_BK(indexPath.row);
        }

        
    }else{
        
        self.DidSelectItem_ArticleModel_BK(self.modelArray[indexPath.row]);
        
    }

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (self.numberOfItemsInSection > 0) {
        
        return self.numberOfItemsInSection;
    }
    
    NSLog(@"%ld",self.modelArray.count);
    return self.modelArray.count;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    
    return self.numberOfSections;
}

//定义每个Item 的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return self.sizeForItem;
    
}


//设置每个collectionView 的margin(边缘间隔)
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return self.insetForSectionAtIndex;
    
}

//最小列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return self.minimumInteritemSpacing;
}

//最小行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return self.minimumLineSpacing;
    
}



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

        UICollectionReusableView *reusableview = nil;
    

       if (kind == UICollectionElementKindSectionHeader){
        
           UICollectionReusableView *sectionHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeadView" forIndexPath:indexPath];

           sectionHeaderView.backgroundColor = white_Color;
           
           
           [sectionHeaderView addSubview:self.loginBt];
           
           reusableview = sectionHeaderView;
        
           return reusableview;

       }else if (kind == UICollectionElementKindSectionFooter){
    
        
           UICollectionReusableView *sectionFoodView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"sectionFootView" forIndexPath:indexPath];
        
        
           sectionFoodView.backgroundColor = [UIColor whiteColor];
        
           
           [sectionFoodView addSubview:self.closedMenuBt];
           
           reusableview = sectionFoodView;
        
           return reusableview;

    
    }else{
    
            return reusableview;

    }
    
}


- (UIButton *)loginBt{
    if (!_loginBt) {
        
       _loginBt = [UIButton quickButtonWithFram:CGRectMake(10, Screen_with/14 - Screen_with/16, Screen_with - 20, Screen_with / 8) andTitle:@"登录" andFont:15.0 andTitleColor:white_Color andBackGroundColor:deepskyblue_Color andCornCornerRadius:3.0 andImageName:nil];

    }
    return _loginBt;
}

- (UIButton *)closedMenuBt{

    if (!_closedMenuBt) {
        
        _closedMenuBt = [UIButton quickButtonWithFram:CGRectMake(10, Screen_with/14 - Screen_with/20, Screen_with - 20, Screen_with / 10) andTitle:@"" andFont:15.0 andTitleColor:white_Color andBackGroundColor:white_Color andCornCornerRadius:0.0 andImageName:@"up_arrow"];

    }

    return _closedMenuBt;
}

#pragma mark- 分组头尾部视图
//分组头尾部视图
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section ==0) {
        return CGSizeMake(0, 0);

    }else{
        return CGSizeMake(Screen_with, Screen_with/7);

    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    
    if (section ==0) {
        
        return CGSizeMake(0, 0);
        
    }else{
        return CGSizeMake(Screen_with, Screen_with/7);
        
    }
}





@end
