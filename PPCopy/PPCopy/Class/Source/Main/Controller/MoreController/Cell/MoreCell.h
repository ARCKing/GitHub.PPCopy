//
//  MoreCell.h
//  PPCopy
//
//  Created by gxtc on 2017/7/24.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UILabel *rubbishLabel;


- (void)setTitleAndIfNeedHiden:(NSInteger)row;


@end
