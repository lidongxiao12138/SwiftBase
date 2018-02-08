//
//  MBTextView.h
//  MobellCloud_ios
//
//  Created by cherry pu on 2017/12/26.
//  Copyright © 2017年 zhangXin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBTextView : UITextView
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic,copy)NSMutableAttributedString* placeAttributedString;
@end
