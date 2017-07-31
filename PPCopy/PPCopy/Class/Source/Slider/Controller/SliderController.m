//
//  SliderController.m
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "SliderController.h"

@interface SliderController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong)SliderMainView * mainViews;
@property (nonatomic,strong)SliderLeftView * leftViews;


@property(nonatomic,strong)UITapGestureRecognizer * tapGesture;
@property(nonatomic,strong)UIPanGestureRecognizer * panGesture;
@property(nonatomic,strong)UILongPressGestureRecognizer * longPressGesture;

@property(nonatomic,strong)UISwipeGestureRecognizer * swipeLeftGesture;
@property(nonatomic,strong)UISwipeGestureRecognizer * swipeRightGesture;

@property(nonatomic,assign)CGFloat lastPan_x;

@property(nonatomic,assign)BOOL isMoveRight;

@end

@implementation SliderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


- (instancetype)initWithMainVC:(UINavigationController *)MainVC andLeftVC:(UINavigationController *)leftVC{


    if (self = [super init]) {
        
        self.lastPan_x = 0.0;
        
        [self.view addSubview:self.leftViews];
        [self.view addSubview:self.mainViews];
        
        [self.view addSubview:self.maskView];
        
        
//        [self.view addGestureRecognizer:self.panGesture];
        
        [self.maskView addGestureRecognizer:self.tapGesture];

        
         [self.view addGestureRecognizer:self.swipeLeftGesture];
         [self.view addGestureRecognizer:self.swipeRightGesture];
        
        /*
         //[A requireGestureRecognizerToFail：B]函数，
         //它可以指定当A手势发生时，即便A已经滿足条件了，也不会立刻触发，会等到指定的手势B确定失败之后才触发。
         
         [self.panGesture requireGestureRecognizerToFail:self.swipeLeftGesture];
         [self.panGesture requireGestureRecognizerToFail:self.swipeRightGesture];
         */
    }

    
    self.mainController = MainVC;
    self.leftController = leftVC;
    
    return self;
}



- (void)buttonAction{

    NSLog(@"123456");

}




- (UIView *)mainViews{
    if (!_mainViews) {
        _mainViews = [[SliderMainView alloc]initWithFrame:CGRectMake(0, 0, Screen_with, Screen_heigh)];
        _mainViews.backgroundColor = [UIColor orangeColor];
        
    }
    return _mainViews;
}

- (UIView *)leftViews{
    if (!_leftViews) {
        _leftViews = [[SliderLeftView alloc]initWithFrame:CGRectMake(0, 0, Screen_with, Screen_heigh)];
        _leftViews.backgroundColor = [UIColor cyanColor];
    }
    return _leftViews;
}


- (UIView *)maskView{
    
    if (!_maskView) {
        
        _maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_with, Screen_heigh)];
        _maskView.backgroundColor = RGB_color(0, 0, 0, 0.6);
        
        _maskView.alpha = 0;
    }
    
    return _maskView;
}


- (void)setLeftController:(UINavigationController *)leftController{

    if (!leftController) {
        return;
    }
    
    _leftController = leftController;
    
    [self addChildViewController:leftController];
    
    [self.leftViews addSubview:leftController.view];
    
    LeftController * leftVC = ( LeftController *)leftController.topViewController;
    
    __weak SliderController * weakSelf = self;
    
    leftVC.goToSearchControllerBK = ^{
    
        SearchController * vc = [[SearchController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
        
    };
    
    
    leftVC.goToBaoLiaoControllerBK = ^{
      
        BaoLiaoController * vc = [[BaoLiaoController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    
    
}



- (void)setMainController:(UINavigationController *)mainController{

    if (!mainController) {
    
        return;
    }
        _mainController = mainController;
        
        [self addChildViewController:mainController];
        
        [self.mainViews addSubview:mainController.view];
    
}






-(UINavigationController *)sliderNavigationController{

    if (self.mainController) {
        
        if ([self.mainController isKindOfClass:[UINavigationController class]]) {
            
            return (UINavigationController *)self.mainController;
        }else if (self.mainController.navigationController){
        
            return self.mainController.navigationController;
        
        }
        
        
    }

    return nil;
}


- (UITabBarController *)sliderTabBarController{

    if (self.mainController) {
        
        if ([self.mainController isKindOfClass:[UITabBarController class]]) {
 
            return (UITabBarController *)self.mainController;
        }else if (self.mainController.tabBarController){
        
            return self.mainController.tabBarController;
        
        }
        
    }

    return nil;
}


-(void)showLeftOrClosedLeft{

    
    if (self.mainViews.frame.origin.x == 0) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.mainViews.frame = CGRectMake(Screen_with - SliderWith, 0, Screen_with, Screen_heigh);
            self.maskView.frame = CGRectMake(Screen_with - SliderWith, 0, Screen_with, Screen_heigh);
            self.maskView.alpha = 1;
        }];
        
        
    }else{
    
        [UIView animateWithDuration:0.3 animations:^{
            
            self.mainViews.frame = CGRectMake(0, 0, Screen_with, Screen_heigh);
            self.maskView.frame = CGRectMake(0, 0, Screen_with, Screen_heigh);
            self.maskView.alpha = 0;
            
        }];
    }
}

#pragma mark- 手势

- (UILongPressGestureRecognizer *)longPressGesture{

    if (!_longPressGesture) {
        
        _longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGestureAction:)];
        _longPressGesture.minimumPressDuration = 0.3;
    }

    return _longPressGesture;
}


- (UITapGestureRecognizer *)tapGesture{


    if (!_tapGesture) {
        
        _tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction:)];
        _tapGesture.numberOfTapsRequired = 1;
        _tapGesture.numberOfTouchesRequired = 1;
    }

    return _tapGesture;
}

- (UIPanGestureRecognizer *)panGesture{

    if (!_panGesture) {
        
        _panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureAction:)];
        
        [_panGesture addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:nil];
        
        _panGesture.delegate = self;
    }
    return _panGesture;

}


- (UISwipeGestureRecognizer *)swipeRightGesture{

    if (!_swipeRightGesture) {
        
        _swipeRightGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRightGestureAction:)];
        _swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
        _swipeRightGesture.delegate = self;

    }
    
    return _swipeRightGesture;
}


- (UISwipeGestureRecognizer *)swipeLeftGesture{
    
    if (!_swipeLeftGesture) {
        
        _swipeLeftGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeftGestureAction:)];
        _swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
        _swipeLeftGesture.delegate = self;
    }
    
    return _swipeLeftGesture;
}



- (void)longPressGestureAction:(UILongPressGestureRecognizer *)longPressP{
    NSLog(@"longPressGestureAction");
}



- (void)tapGestureAction:(UITapGestureRecognizer *)tap{

        [self showLeftOrClosedLeft];
    
}


- (void)panGestureAction:(UIPanGestureRecognizer *)pan{
    
    
    
    // 获取手势的触摸点
    //CGPoint point1 = [pan locationInView:self.view];
    
    // 获取手势的移动，也是相对于最开始的位置
    CGPoint point2 = [pan translationInView:self.view];
    
    CGFloat point_x2 = point2.x;

    CGFloat current_x = self.mainViews.frame.origin.x;
    
    NSLog(@"panGestureAction-self.mainViews.frame.origin.x:%f point_x2:%f",current_x,point_x2);
    
    self.maskView.alpha = current_x/(Screen_with - SliderWith);
    
  
    //从上一次拖动位置开始继续
    self.mainViews.transform = CGAffineTransformTranslate(self.mainViews.transform, point_x2, 0);
    
    self.maskView.transform = CGAffineTransformTranslate(self.maskView.transform, point_x2, 0);

    
    //复位
    [pan setTranslation:CGPointZero inView:self.mainViews];
    
    
}


- (void)swipeRightGestureAction:(UISwipeGestureRecognizer *)swipe{
    
    NSLog(@"🐴swipeRightGestureAction");
    
    [UIView animateWithDuration:0.3 animations:^{

    self.mainViews.frame = CGRectMake(Screen_with - SliderWith, 0, Screen_with, Screen_heigh);
    self.maskView.frame = CGRectMake(Screen_with - SliderWith, 0, Screen_with, Screen_heigh);
    self.maskView.alpha = 1;
    
    }];
}



- (void)swipeLeftGestureAction:(UISwipeGestureRecognizer *)swipe{
    
    NSLog(@"swipeLeftGestureAction🐴");
    
    [UIView animateWithDuration:0.3 animations:^{
    self.mainViews.frame = CGRectMake(0, 0, Screen_with, Screen_heigh);
    self.maskView.frame = CGRectMake(0, 0, Screen_with, Screen_heigh);
    self.maskView.alpha = 0;
    }];
}


/**手势状态监听*/
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{

    

    
    
    if (self.panGesture.state == UIGestureRecognizerStateBegan) {
    
        NSLog(@"observeValueForKeyPath-手势开始");
        
        
        if (self.mainViews.frame.origin.x == 0) {
        
            self.isOpenState = NO;
            
        }else{
        
            self.isOpenState = YES;
        }
        
        
    }
    
    
    if (self.panGesture.state == UIGestureRecognizerStateChanged) {
        
        NSLog(@"observeValueForKeyPath-正在拖动!");
        
        
    }

    
    
    if (self.panGesture.state == UIGestureRecognizerStateEnded) {
        
        NSLog(@"observeValueForKeyPath-拖动结束!");
        
    
        [UIView animateWithDuration:0.3 animations:^{
            
            [self springAnimation];

        }];
        
    }
    
}



- (void)springAnimation{

    CGFloat current_x = self.mainViews.frame.origin.x;

    if (self.isOpenState == NO) {
        
        if ( current_x > Screen_with/5){

            self.mainViews.frame = CGRectMake(Screen_with - SliderWith, 0, Screen_with, Screen_heigh);
            
            self.maskView.frame = CGRectMake(Screen_with - SliderWith, 0, Screen_with, Screen_heigh);
            self.maskView.alpha = 1.0;
        }else{
        
            self.mainViews.frame = CGRectMake(0, 0, Screen_with, Screen_heigh);
            
            self.maskView.frame = CGRectMake(0, 0, Screen_with, Screen_heigh);
            self.maskView.alpha = 0.0;
        }
        
    }else{
    
        if ( current_x < Screen_with - SliderWith - 20){
            
            self.mainViews.frame = CGRectMake(0, 0, Screen_with, Screen_heigh);
            
            self.maskView.frame = CGRectMake(0, 0, Screen_with, Screen_heigh);
            self.maskView.alpha = 0.0;

        }else{
            
            self.mainViews.frame = CGRectMake(Screen_with - SliderWith, 0, Screen_with, Screen_heigh);
            
            self.maskView.frame = CGRectMake(Screen_with - SliderWith, 0, Screen_with, Screen_heigh);
            self.maskView.alpha = 1.0;

        }

    }
    
}


/*
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    CGPoint velocity = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self.view];

    if (velocity.x > 0) {
        
        self.isMoveRight = YES;
        NSLog(@"slider右!!!!!!!!");

    }else{
    
        self.isMoveRight = NO;
        NSLog(@"slider左!!!!!!!!");

    }

    if (self.mainViews.frame.origin.x == Screen_with - SliderWith && self.isMoveRight == YES) {
        
        return NO;
    }
    
    
    return YES;
    
}

*/

//是否支持多时候触发，返回YES，则可以多个手势一起触发方法，返回NO则为互斥
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{return YES;}


//这个方法返回YES，第一个手势和第二个互斥时，第一个会失效
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{ return YES;}


//这个方法返回YES，第一个手势和第二个互斥时，第二个会失效
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{}


@end
