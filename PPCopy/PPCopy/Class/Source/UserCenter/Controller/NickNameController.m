//
//  NickNameController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/12.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "NickNameController.h"

@interface NickNameController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *arrowButton;

@property (weak, nonatomic) IBOutlet UILabel *charactNumberLabel;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIView *line;

@property (nonatomic, assign)BOOL isShow;

@end

@implementation NickNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (self.isNickName || self.isSignName) {
        
        self.arrowButton.hidden = YES;
        
    }else if (self.isLocation){
    
        self.charactNumberLabel.hidden = YES;
        self.textField.placeholder = @"";
        self.textField.userInteractionEnabled = NO;
        self.isShow = NO;
    }
    
    
    
}

- (IBAction)arrowButtonAction:(id)sender {
    
    NSLog(@"地区");
    
    if (!self.isShow) {
        
        [self.view addSubview:self.collectionView];
        
        self.isShow = YES;
        
    }else{
    
        [self.collectionView removeFromSuperview];
        
        self.isShow = NO;
    }
}



- (IBAction)popBackButtonAction:(id)sender {
    
    [self RootAddPanGuesterController_popBackButtonAction];
}


- (IBAction)textFieldEditingDidEnd:(id)sender {
    
}


- (IBAction)enterButtonAction:(id)sender {
    
    NSLog(@"enterButtonAction");

}






- (MainCollectionView *)collectionView{


    if (!_collectionView) {
        
        _collectionView = [[MainCollectionView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.line.frame), Screen_with - 40, Screen_heigh - 64)];
        _collectionView.isAddHeadView = NO;
        _collectionView.numberOfSections = 1;
        _collectionView.numberOfItemsInSection = 34;
        _collectionView.sizeForItem = CGSizeMake((Screen_with - 45)/4, Screen_with/10);
        
        _collectionView.insetForSectionAtIndex = UIEdgeInsetsMake(1, 1, 1, 1);
        _collectionView.minimumInteritemSpacing = 1;
        _collectionView.minimumLineSpacing = 1;
        
        _collectionView.cellClass = @"UserCenterLocationCell";
        
        _collectionView.collectionViewName = @"NickName";
        _collectionView.collectionView.backgroundColor = white_Color;

        _collectionView.titleArray1 = @[@"上海",@"北京",@"天津",@"重庆",
                                        @"河北",@"河南",@"云南",@"辽宁",
                                        @"黑龙江",@"湖南",@"安徽",@"江苏",
                                        @"山东",@"新疆",@"浙江",@"江西",
                                        @"湖北",@"广西",@"甘肃",@"山西",
                                        @"内蒙古",@"陕西",@"吉林",@"福建",
                                        @"贵州",@"广东",@"青海",@"西藏",
                                        @"四川",@"宁夏",@"海南",@"台湾",
                                        @"香港",@"澳门"];
        
    }

    return _collectionView;

}




@end
