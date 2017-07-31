//
//  LeftChannelCollectionView.m
//  PPCopy
//
//  Created by gxtc on 2017/7/1.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "LeftChannelCollectionView.h"

#define cell_With (Screen_with  - Screen_with/6 - SliderWith - 2 )/2


@interface LeftChannelCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation LeftChannelCollectionView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self RootViewAddUI];
    }
    
    return self;
}


-(void)RootViewAddUI{

    [self addSubview:self.collectionView];
}


- (UICollectionView *)collectionView{


    if (!_collectionView) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ChannelCollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        _collectionView.backgroundColor = lightgrey_Color;
        
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.bounces = NO;
        
    }

    return _collectionView;

}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * reuseIdentifier = @"UICollectionViewCell";
    
    ChannelCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    for (UIView * subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
 
    
    NSLog(@"我点击");
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 30;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

//定义每个Item 的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(cell_With, cell_With);
    
}


//设置每个collectionView 的margin(边缘间隔)
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0 ,0, 0);
    
}

//最小列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 1;
}

//最小行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 1;
    
}

@end
