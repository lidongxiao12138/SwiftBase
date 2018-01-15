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
    var dataArr = [HomeModel]()
    var imageArr = [HomeModel]()
    //MARK:----------- 首页数据加载接口
    func requsethome()
    {

//        JQProgressHUDTool.jq_showNormalHUD()
        
        let params:Dictionary = ["sign" : kSignName]
        let UrlStr = kIPAddress+kPointUrl
        print(UrlStr)
        Alamofire.request(UrlStr, method: .post, parameters: params).responseJSON { (response) in
            switch response.result.isSuccess {
            case true:
                
                let jsonStr = JSON.init(response.result.value as Any)
                if let items = jsonStr["data"]["hot_position"].array {
                    //遍历数组得到每一个字典模型
                    for dictt in items{
                        let homemodel = HomeModel()
                        homemodel.title = dictt["title"].string ?? ""
                        homemodel.province = dictt["province"].string ?? ""
                        homemodel.city = dictt["city"].string ?? ""
                        homemodel.enroll_count = dictt["enorll_count"].string ?? "0"
                        homemodel.money_min = dictt["money_min"].string ?? ""
                        homemodel.money_max = dictt["money_max"].string ?? ""
                        homemodel.welfares = dictt["welfares"].array as NSArray?
                        self.dataArr.append(homemodel)
                    }
                    if let banner = jsonStr["data"]["banner"].array {
                        for dic in banner
                        {
                            let homemodel = HomeModel()
                            homemodel.image = dic["image"].string ?? ""
                            homemodel.url = dic["url"].string ?? ""
                            self.imageArr.append(homemodel)
                        }
                        
                    }
                    
//                    self.loadCycleView()
                    //MARK:=========== 取消小菊花 ==============
//                    JQProgressHUDTool.jq_hideHUD()
                    
//                    self.hometableView.reloadData()
                }
                print("获取数据成功")
            case false:
                //MARK:=========== 取消小菊花 ==============
//                JQProgressHUDTool.jq_hideHUD()
//                JQProgressHUDTool.jq_showNormalHUD(msg:"网络错误")
                print(response.result.error as Any)
            }
            
//            self.hometableView.mj_header.endRefreshing()
        }
        

 
        
        
    
    }
}

