//
//  UIImage+Category.h
//  EVA
//
//  Created by Apple on 15/2/3.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#define HEADER_IMG_MAX_WIDTH  200
#define HEADER_IMG_MAX_HEIGHT 200

@interface UIImage (Category)

+ (UIImage *)getImageWithImageNamed:(NSString *)imageName;
+ (UIImage *)getPureImageWithColor:(UIColor *)color;
+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius;
+ (UIImage *)imageFromTopColor:(UIColor *)topColor andBottomColor:(UIColor*)bottomColor forTopSize:(CGSize)topSize andBottomSize:(CGSize)bottomSize withCornerRadius:(CGFloat)radius;
//对图片切圆角
- (UIImage *)imageWithCornerRadius:(CGFloat)radius;
+ (UIImage *)resizeImage:(NSString *)imageName;
//    制作圆形图片
+ (UIImage *)circleImage:(UIImage *)originalImage;
+ (UIImage *)circleImage:(UIImage *)originalImage baseSize:(CGSize)size;

+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size;

//    按照比例缩放图片
+ (UIImage *)scaleImage:(UIImage *)originalImage baseSize:(CGSize)size;

+ (UIImage *)scaleBigImage:(UIImage *)image;

- (UIImage *)fixOrientation;

//对圆形图片画上边框
+ (UIImage *)addCircleLineToImage:(UIImage *)image withCircleColor:(UIColor *)color;

//对控件进行截图
+ (UIImage *) captureSubView:(UIView *)view;

//图片合成
+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2;

+ (UIImage *)insertImage:(UIImage *)image belowImage:(UIImage *)coverImage;

+ (UIImage *)clipPartImageFromImage:(UIImage *)image;

//获取视频封面
+ (UIImage*) getVideoPreViewImageWithFilePath:(NSString*)filePath;

- (UIImage *)clipSquarePartImageInScreenWithMarginPercent:(CGFloat)percent andVideoOrientation:(AVCaptureVideoOrientation)videoOrientation;

//根据特定图片宽高比，切出符合比例的图片
- (UIImage *)clipRatioImageWithImageWidthHeightRatio:(CGFloat)ratio;

- (UIImage *)normalizedImage;

/**
 * 将UIColor变换为UIImage
 **/
+ (UIImage *)createImageWithColor:(UIColor *)color;

+ (UIImage *)blurImage:(UIImage *)image floatBlurLevel:(CGFloat)level;

@end
