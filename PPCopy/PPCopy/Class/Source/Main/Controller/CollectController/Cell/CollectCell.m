//
//  CollectCell.m
//  PPCopy
//
//  Created by gxtc on 2017/7/24.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "CollectCell.h"


@interface CollectCell()

@property (weak, nonatomic) IBOutlet UIImageView *leftImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *littleLabel;
@end

@implementation CollectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
