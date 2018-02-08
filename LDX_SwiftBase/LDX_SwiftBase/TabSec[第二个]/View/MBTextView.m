//
//  MBTextView.m
//  MobellCloud_ios
//
//  Created by cherry pu on 2017/12/26.
//  Copyright © 2017年 zhangXin. All rights reserved.
//

#import "MBTextView.h"

@interface MBTextView ()
@property (nonatomic,strong)UILabel* placeholderLabel;
@end

@implementation MBTextView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupHabit];
    }
    return self;
}

-(void)setupHabit
{
    // 1.添加提示文字
    UILabel *placeholderLabel = [[UILabel alloc] init];
    placeholderLabel.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    placeholderLabel.hidden = YES;
    placeholderLabel.numberOfLines = 0;
    placeholderLabel.backgroundColor = [UIColor clearColor];
    placeholderLabel.font = self.font;
    [self insertSubview:placeholderLabel atIndex:0];
    self.placeholderLabel = placeholderLabel;
    
    // 2.监听textView文字改变的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
}


- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    self.placeholderLabel.text = placeholder;
    if (placeholder.length) { // 需要显示
        self.placeholderLabel.hidden = NO;
        
        // 计算frame
        CGFloat placeholderX = 6;
        CGFloat placeholderY = 6;
        CGFloat maxW = self.frame.size.width - 2 * placeholderX;
        CGFloat maxH = self.frame.size.height - 2 * placeholderY;
        CGSize placeholderSize = [placeholder boundingRectWithSize:CGSizeMake(maxW, maxH) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.placeholderLabel.font,NSFontAttributeName, nil] context:nil].size;
        self.placeholderLabel.frame = CGRectMake(placeholderX, placeholderY, placeholderSize.width, placeholderSize.height);
    } else {
        self.placeholderLabel.hidden = YES;
    }
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
}

-(void)setPlaceAttributedString:(NSMutableAttributedString *)placeAttributedString
{
    _placeAttributedString = placeAttributedString;
    
    if (placeAttributedString.length) { // 需要显示
        self.placeholderLabel.hidden = NO;
        
        // 计算frame
        CGFloat placeholderX = 6;
        CGFloat placeholderY = 6;
        CGFloat maxW = self.frame.size.width - 2 * placeholderX;
        CGFloat maxH = self.frame.size.height - 2 * placeholderY;
        self.placeholderLabel.attributedText = placeAttributedString;
        CGSize placeholderSize = [placeAttributedString.string boundingRectWithSize:CGSizeMake(maxW, maxH) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.placeholderLabel.font,NSFontAttributeName, nil] context:nil].size;
        
        self.placeholderLabel.frame = CGRectMake(placeholderX, placeholderY, placeholderSize.width,placeholderSize.height);
    } else {
        self.placeholderLabel.hidden = YES;
    }
    
}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeholderLabel.font = font;
}

- (void)textDidChange
{
    self.placeholderLabel.hidden = (self.text.length != 0);
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
