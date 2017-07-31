//
//  RootView.m
//  PPCopy
//
//  Created by gxtc on 2017/6/28.
//  Copyright © 2017年 gxtc. All rights reserved.
//

#import "RootView.h"

@implementation RootView


- (void)RootViewAddUI{
    
    NSLog(@"RootViewAddUI");
}

- (JsonAnalyzeManger *)jsonAnalyzeManger{
    
    if (!_jsonAnalyzeManger) {
        
        _jsonAnalyzeManger = [JsonAnalyzeManger shareJsonAnaylzeManger];
    }
    return _jsonAnalyzeManger;
}

@end
