//
//  MSSAutoresizeLabelFlowConfig.m
//  MSSAutoresizeLabelFlow
//
//  Created by Mrss on 15/12/26.
//  Copyright © 2015年 expai. All rights reserved.
//

#import "MSSAutoresizeLabelFlowConfig.h"

@implementation MSSAutoresizeLabelFlowConfig

+ (MSSAutoresizeLabelFlowConfig *)shareConfig {
    static MSSAutoresizeLabelFlowConfig *config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[self alloc]init];
    });
    return config;
}

// default

- (instancetype)init {
    self = [super init];
    if (self) {
        self.contentInsets = UIEdgeInsetsMake(10, 10, 10, 2);
        self.lineSpace = 10;
        self.itemHeight = 25;
        self.itemSpace = 10;
        self.itemCornerRaius = 25/2;
//        self.itemColor = [UIColor whiteColor];
        self.itemColor = BaseLDXColor;
        self.textMargin = 20;
//        self.textColor = [UIColor darkTextColor];
        self.textColor = [UIColor blackColor];
        self.textFont = [UIFont systemFontOfSize:15];
//        self.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
//        self.backgroundColor = BaseLDXColor;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
