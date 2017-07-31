//
//  ReadHestoryController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/12.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "ReadHestoryController.h"


#define HiTV_CHECK_ERROR \
NSError *error = [params validate]; \
if (error) { \
if (completion) completion(self, nil, error); \
return; \
}


@interface ReadHestoryController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ReadHestoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = Screen_with/4;
}

- (IBAction)popButtonAction:(id)sender {
    
    [self RootAddPanGuesterController_popBackButtonAction];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ReadHestoryCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ReadHestoryCell" owner:@"cell" options:nil]firstObject];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"didDeselectRowAtIndexPath");
}
@end
