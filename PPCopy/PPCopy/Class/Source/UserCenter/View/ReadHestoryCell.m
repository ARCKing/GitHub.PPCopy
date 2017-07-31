//
//  ReadHestoryCell.m
//  PPCopy
//
//  Created by gxtc on 2017/7/12.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "ReadHestoryCell.h"

@interface ReadHestoryCell()

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *bigTitle;
@property (weak, nonatomic) IBOutlet UILabel *littleTitle;

@end

@implementation ReadHestoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
