//
//  MainCollectionView.h
//  PPCopy
//
//  Created by gxtc on 2017/7/3.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"
#import "RootCollectionCell.h"
#import "HomeHeadPageView.h"

typedef void(^MainCollectionView_DidSelectItem_ArticleModel_Block)(ArticleModel *);
typedef void(^MainCollectionView_DidSelectItem_Menu_Block)(NSInteger,NSInteger);

@interface MainCollectionView : RootView

@property(nonatomic,copy)MainCollectionView_DidSelectItem_ArticleModel_Block DidSelectItem_ArticleModel_BK;

@property(nonatomic,copy)MainCollectionView_DidSelectItem_Menu_Block DidSelectItem_Menu_BK;


@property(nonatomic,strong)UICollectionView * collectionView;

@property(nonatomic,strong)UIView * collectionViewHeadView;

@property(nonatomic,assign)BOOL isAddHeadView;

@property(nonatomic,strong)HomeHeadPageView * headView;


@property(nonatomic,assign)BOOL isAddSectionHeadFootView;

/**每组个数*/
@property(nonatomic,assign)NSInteger numberOfItemsInSection;

/**组数*/
@property(nonatomic,assign)NSInteger numberOfSections;

/**Cell大小*/
@property(nonatomic,assign)CGSize sizeForItem;

/**边缘间距*/
@property(nonatomic,assign)UIEdgeInsets insetForSectionAtIndex;

/**最小列间距*/
@property(nonatomic,assign)CGFloat minimumInteritemSpacing;

/**最小行间距*/
@property(nonatomic,assign)CGFloat minimumLineSpacing;


/**Cell1*/
@property(nonatomic,strong)RootCollectionCell * cell1;

/**Cell2*/
@property(nonatomic,strong)RootCollectionCell * cell2;


/**cell类名1*/
@property(nonatomic,copy)NSString * cellClass;

/**cell类名2*/
@property(nonatomic,copy)NSString * cellClassSecond;

/**collectionView的类型标记*/
@property(nonatomic,copy)NSString * collectionViewName;


@property(nonatomic,strong)UIButton * loginBt;
@property(nonatomic,strong)UIButton * closedMenuBt;

/**MenuCollectionView 数据源1*/
@property(nonatomic,strong)NSArray * titleArray1;

/**MenuCollectionView 数据源2—1*/
@property(nonatomic,strong)NSArray * titleArray2;

/**MenuCollectionView 数据源2-2*/
@property(nonatomic,strong)NSArray * titleIconArray2;

/**Model数据源*/
@property(nonatomic,strong)NSMutableArray * modelArray;

@end
