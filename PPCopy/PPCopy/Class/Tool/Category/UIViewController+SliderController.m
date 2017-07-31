//
//  UIViewController+SliderController.m
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "UIViewController+SliderController.h"


@implementation UIViewController (SliderController)

-(SliderController *)sliderController{


    UIViewController * controller = (UIViewController *)self.parentViewController;

   while (controller) {
        if ([controller isKindOfClass:[SliderController class]]) {
            
            return (SliderController *)controller;
            
        }else if (controller.parentViewController && controller.parentViewController !=controller){
        
            controller = (UIViewController *)controller.parentViewController;
        
        }else{
            
            return nil;
        }
    }

    return nil;
}

@end
