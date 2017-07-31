//
//  MoreController.m
//  PPCopy
//
//  Created by gxtc on 2017/7/24.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "MoreController.h"

@interface MoreController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong,nonatomic) UICollectionViewFlowLayout * flowLayout;

//存放缓存的大小
@property (nonatomic ,assign)CGFloat Cache;

@property (nonatomic,strong)UILabel * cacheLabel;


@end

@implementation MoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    [self addUI];
    
}


- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    
}


- (void)addUI{
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.collectionViewLayout = self.flowLayout;
    
}


- (UICollectionViewFlowLayout *)flowLayout{

    if (!_flowLayout) {
        
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _flowLayout;
}

- (IBAction)popBackButtonAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark- delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 4;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


    if (indexPath.row == 0) {
        
        [self ClearManager];
        
    }else if (indexPath.row == 1){
    
        UserRespondsController * vc = [[UserRespondsController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 2){
        
        JoinUsController * vc = [[JoinUsController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 3){
        AboutUsController * vc = [[AboutUsController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];

    }

}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UINib * nibCell = [UINib nibWithNibName:@"MoreCell" bundle:[NSBundle mainBundle]];
    
    [self.collectionView registerNib:nibCell forCellWithReuseIdentifier:@"cell"];
    
    MoreCell * cell = [[MoreCell alloc]init];
    
    cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell setTitleAndIfNeedHiden:indexPath.row];
    
    
    if (indexPath.row == 0) {
        
        self.cacheLabel = cell.rubbishLabel;
        
        [self cacheCount];

    }
    
    
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(Screen_with - 20, 50);

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{


    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 1;
}






/**当前缓存大小*/
- (void)cacheCount{
    //程序进入就计算缓存大小
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
    NSLog(@"%@",paths);
    
    NSString *cachesDir = [paths objectAtIndex:0];
    
    self.Cache = [self folderSizeAtPath:cachesDir];
    
    self.cacheLabel.text = [NSString stringWithFormat:@"%.2fM",self.Cache];
    
}

//清空数据库
-(void)ClearManager
{
    if (self.Cache==0) {
        return;
    }
    //清理缓存文件
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    
    [self clearCache:cachesDir];
    
    self.cacheLabel.text = @"0.00M";
}


//清理缓存文件
//同样也是利用NSFileManager API进行文件操作，SDWebImage框架自己实现了清理缓存操作，我们可以直接调用。
- (void)clearCache:(NSString*)path
{
    
    NSFileManager*fileManager=[NSFileManager defaultManager];
    
    if([fileManager fileExistsAtPath:path]) {
        
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        
        for(NSString * fileName in childerFiles) {
            
            //如有需要，加入条件，过滤掉不想删除的文件
            
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
    // SDImageCache 自带缓存
    //    [[SDImageCache sharedImageCache] cleanDisk];
}


#pragma mark-计算目录大小
//计算目录大小
- (float)folderSizeAtPath:(NSString*)path
{
    NSFileManager*fileManager = [NSFileManager defaultManager];
    CGFloat folderSize = 0.0;
    
    if([fileManager fileExistsAtPath:path]) {
        
        NSArray * childerFiles=[fileManager subpathsAtPath:path];
        
        for(NSString *fileName in childerFiles) {
            
            NSString*absolutePath = [path stringByAppendingPathComponent:fileName];
            // 计算单个文件大小
            folderSize += [self fileSizeAtPath:absolutePath];
        }
    }
    return folderSize;
}


#pragma mark- 计算单个文件大小返回值是M
//计算单个文件大小返回值是M
- (float)fileSizeAtPath:(NSString*)path
{
    NSFileManager*fileManager=[NSFileManager defaultManager];
    
    if([fileManager fileExistsAtPath:path]){
        
        long long size = [fileManager attributesOfItemAtPath:path error:nil].fileSize;
        // 返回值是字节B K M
        return size/1024.0/1024.0;
    }
    return 0;
}



@end
