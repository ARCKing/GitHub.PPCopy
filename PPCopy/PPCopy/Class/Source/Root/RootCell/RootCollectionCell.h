//
//  RootCollectionCell.h
//  PPCopy
//
//  Created by gxtc on 2017/7/6.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootCollectionCell : UICollectionViewCell

@property(nonatomic,strong)UILabel * bigTitle;

@property(nonatomic,strong)UIButton * bt;

@property(nonatomic,strong)ArticleModel * articleModel;

- (void)addTitles1:(NSString *)bigTitle;

- (void)addTitles2:(NSString *)Title andIcon:(NSString *)iconName;

@end
