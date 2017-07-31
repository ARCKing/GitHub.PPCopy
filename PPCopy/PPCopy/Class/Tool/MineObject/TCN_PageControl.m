//
//  TCN_PageControl.m
//  PPCopy
//
//  Created by gxtc on 2017/6/29.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "TCN_PageControl.h"

@implementation TCN_PageControl

- (void)setCurrentPage:(NSInteger)currentPage{

    [super setCurrentPage:currentPage];

    
    for (NSUInteger subViewIndex = 0; subViewIndex < [self.subviews count]; subViewIndex++) {
        
        CGSize size = CGSizeMake(4.0, 4.0);
        
        if (subViewIndex == currentPage) {
            size = CGSizeMake(5.0, 5.0);
        }
        
        
        UIImageView * subImageView = [self.subviews objectAtIndex:subViewIndex];
        subImageView.frame = CGRectMake(subImageView.frame.origin.x, subImageView.frame.origin.y, size.width, size.height);
        
    }
}

@end
