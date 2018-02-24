//
//  LDXHTTPResponse.h
//  LDX_SwiftBase
//
//  Created by cherry pu on 2018/2/23.
//  Copyright © 2018年 LDX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDXHTTPResponse : NSObject
/**
 *  返回数据
 */
@property (nonatomic,strong) id result;

/**
 *  错误码
 */
@property (nonatomic,assign) NSInteger status;

/**
 *  错误信息说明
 */
@property (nonatomic,copy) NSString * msg;


- (instancetype)initWithJsonData:(id)json;

@end
