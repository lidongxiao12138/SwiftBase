//
//  UIFont+LayoutFit.h
//  Dream
//
//  Created by eva on 16/2/2.
//  Copyright © 2016年 Eva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (LayoutFit)
/**
 *  根据比例算出适配后的文字大小 medium
 *
 *  @param fontSize 基准屏幕下的文字尺寸
 *
 *  @return 适配后的文字尺寸
 */
+ (UIFont *)lf_mediumFontOfSize:(CGFloat)fontSize;


+ (UIFont *)lf_regularFontOfSize:(CGFloat)fontSize;


/**
 *  根据比例算出适配后的文字大小
 *
 *  @param fontSize 基准屏幕下的文字尺寸
 *
 *  @return 适配后的文字尺寸
 */
+(UIFont *)lf_systemFontOfSize:(CGFloat)fontSize;

/**
 *  根据比例算出适配后的文字大小
 *
 *  @param fontSize 基准屏幕下的文字尺寸
 *
 *  @return 适配后的文字尺寸
 */
+(UIFont *)lf_boldSystemFontOfSize:(CGFloat)fontSize;


@end
