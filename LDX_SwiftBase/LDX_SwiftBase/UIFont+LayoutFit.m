//
//  UIFont+LayoutFit.m
//  Dream
//
//  Created by eva on 16/2/2.
//  Copyright © 2016年 Eva. All rights reserved.
//

#import "UIFont+LayoutFit.h"

@implementation UIFont (LayoutFit)

+ (UIFont *)lf_mediumFontOfSize:(CGFloat)fontSize
{
    if (@available(iOS 8.2, *)) {
        return [UIFont systemFontOfSize:[UIView lf_sizeFromIphone6:fontSize] weight:UIFontWeightRegular];
    } else {
        return [UIFont systemFontOfSize:[UIView lf_sizeFromIphone6:fontSize]];
    }
}

+ (UIFont *)lf_regularFontOfSize:(CGFloat)fontSize
{
    if (@available(iOS 8.2, *)) {
        return [UIFont systemFontOfSize:[UIView lf_sizeFromIphone6:fontSize] weight:UIFontWeightMedium];
    } else {
        return [UIFont systemFontOfSize:[UIView lf_sizeFromIphone6:fontSize]];
    }
}

+(UIFont *)lf_systemFontOfSize:(CGFloat)fontSize{
    return [UIFont systemFontOfSize:[UIView lf_sizeFromIphone6:fontSize]];
}

+(UIFont *)lf_boldSystemFontOfSize:(CGFloat)fontSize{
    return [UIFont boldSystemFontOfSize:[UIView lf_sizeFromIphone6:fontSize]];
}



@end
