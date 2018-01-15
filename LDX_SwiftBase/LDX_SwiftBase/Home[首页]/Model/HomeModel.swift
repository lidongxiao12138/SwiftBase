//
//  HomeModel.swift
//  LDX_SwiftBase
//
//  Created by mac on 2017/12/28.
//  Copyright © 2017年 LDX. All rights reserved.
//

import UIKit

class HomeModel: NSObject {
    var title : String?//企业名称
    var image : String?//企业头像
    var province : String?//城市省名称
    var city : String?//城市
    var enroll_count : String?//报名人数
    var money_min : String?//最少钱数
    var money_max : String?//最多钱数
    var subsidy : String?//返利
    var url : String?//跳转地址
    var welfares : NSArray?//福利数组

//    init(dict:[String:Any]) {
//        super.init()
//        setValuesForKeys(dict)
//    }
    
    
    
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}





