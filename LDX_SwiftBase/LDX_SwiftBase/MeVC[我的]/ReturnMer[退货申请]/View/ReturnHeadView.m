//
//  ReturnHeadView.m
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/7.
//  Copyright © 2018年 LDX. All rights reserved.
//

#import "ReturnHeadView.h"

@implementation ReturnHeadView

-(void)awakeFromNib
{
    [super awakeFromNib];
    LLImagePickerView *pickerV = [LLImagePickerView ImagePickerViewWithFrame:CGRectMake(0, 0, KScreenWidth, 0) CountOfRow:4];
    pickerV.type = LLImageTypePhotoAndCamera;
    pickerV.allowMultipleSelection = YES;
    pickerV.showAddButton = YES;
    pickerV.showDelete = YES;
    pickerV.maxImageSelected = 4;
    pickerV.backgroundColor = [UIColor whiteColor];
    [self.ViewImageAdd addSubview:pickerV];
    [pickerV observeSelectedMediaArray:^(NSArray<LLImagePickerModel *> *list) {
        NSLog(@"%@",list);
    }];
    self.ViewImageAdd.frame = pickerV.frame;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
