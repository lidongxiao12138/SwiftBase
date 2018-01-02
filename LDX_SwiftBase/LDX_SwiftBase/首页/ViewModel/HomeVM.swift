//
//  HomeVM.swift
//  LDX_SwiftBase
//
//  Created by mac on 2017/12/29.
//  Copyright © 2017年 LDX. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MJRefresh

class HomeVC {
    
    var modelArr = Array<HomeModel>()
    
    //MARK:----------- 首页数据加载接口
    func requsethome()
    {

        let params:Dictionary = ["sign" : kSignName]
        let UrlStr = kIPAddress+kPointUrl
        print(UrlStr)

        NetworkTool.resquset(type: .POST, urlString: UrlStr, paramters: params) { (response) in
            let jsonStr = JSON.init(response)
            if let items = jsonStr["data"]["announce"].array{
                for dic in items {
                    let homeModel = HomeModel()
                    homeModel.car_number = dic["name"].string ?? ""
                    self.modelArr.append(homeModel)
                }
            }
            print(self.modelArr)
        }
    }
}

