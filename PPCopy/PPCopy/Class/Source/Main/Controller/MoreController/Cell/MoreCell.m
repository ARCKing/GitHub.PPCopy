//
//  MoreCell.m
//  PPCopy
//
//  Created by gxtc on 2017/7/24.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "MoreCell.h"

@interface MoreCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *LeftImageView;

@end

@implementation MoreCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSLog(@"nib");
    
    
}


- (void)setTitleAndIfNeedHiden:(NSInteger)row{

    NSArray * titArr = @[@"清理缓存",@"用户反馈",@"加入我们",@"关于我们"];
    
    if (row == 0) {
        
        self.rubbishLabel.hidden = NO;

        self.LeftImageView.image = [UIImage imageNamed:@"icon_rubbish"];
        
    }else{
    
        self.rubbishLabel.hidden = YES;

    }

    self.titleLabel.text = titArr[row];
    
}

@end
