//
//  UIView+LayoutFit.h
//  Dream
//
//  Created by eva on 16/2/2.
//  Copyright © 2016年 Eva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LayoutFit)

//依据iPhone5的尺寸得到当前屏幕相对于iPhone6屏幕尺寸的大小
+(CGFloat)lf_sizeFromIphone6:(CGFloat)size;

//依据真实的尺寸得到iPhone6屏幕尺寸的大小
+(CGFloat)lf_sizeFromRealSize:(CGFloat)size;

//根据iPhone5的尺寸获得指定宽度相对于iPhone6屏幕尺寸的正方形size
+(CGSize)lf_rectSizeFromIphone6:(CGFloat)size;

//依据iPhone5的尺寸得到当前屏幕相对于iPhone6屏幕尺寸的整数大小
+(int)ceilLf_sizeFromIphone6:(CGFloat)size;

@end
