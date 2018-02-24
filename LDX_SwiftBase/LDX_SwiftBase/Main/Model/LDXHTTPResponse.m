//
//  LDXHTTPResponse.m
//  LDX_SwiftBase
//
//  Created by cherry pu on 2018/2/23.
//  Copyright © 2018年 LDX. All rights reserved.
//

#import "LDXHTTPResponse.h"

@implementation LDXHTTPResponse
- (instancetype)initWithJsonData:(id)json
{
    return [LDXHTTPResponse mj_objectWithKeyValues:json];
}

@end
