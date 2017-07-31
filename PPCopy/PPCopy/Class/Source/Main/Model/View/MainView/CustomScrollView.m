//
//  CustomScrollView.m
//  PPCopy
//
//  Created by gxtc on 2017/7/3.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "CustomScrollView.h"


@interface CustomScrollView()

@property(nonatomic,assign)BOOL isMoveRight;

@end

@implementation CustomScrollView


//1返回值是返回是否生效。此方法在gesture recognizer视图转出UIGestureRecognizerStatePossible状态时调用，如果返回NO,则转换到UIGestureRecognizerStateFailed;如果返回YES,则继续识别触摸序列
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    //滑动速度
    CGPoint velocity = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self];
    
//    CGPoint location = [gestureRecognizer locationInView:self];
    
//    NSLog(@"velocity.x:%f---location.x:%d",velocity.x,(int)location.x%(int)[UIScreen mainScreen].bounds.size.width);
    
    //x方向速度>0为右滑动，反之为左滑动
    if (velocity.x > 0) {
        
        self.isMoveRight = YES;
        
        NSLog(@"向右滑动.•.•.•.•.•.");
        
    }else{
        self.isMoveRight = NO;
        
        NSLog(@"向左滑动.•.•.•.•.•.");
    }
    
    return YES;

}



//2
//此方法返回YES时，手势事件会一直往下传递(允许多手势触发)，不论当前层次是否对该事件进行响应。
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    
    UIScrollView * scrollvire = (UIScrollView *)gestureRecognizer.view;
    
    NSLog(@"•.•.•.•.•.•.•.•.•.•.•.•");
    
    //根据contentOffset.x 与 滑动方向 来判断手势是否向下传递
    if (scrollvire.contentOffset.x == 0 && self.isMoveRight == YES) {
        
        return YES;
    }
    
    return NO;
    

    
}

@end
