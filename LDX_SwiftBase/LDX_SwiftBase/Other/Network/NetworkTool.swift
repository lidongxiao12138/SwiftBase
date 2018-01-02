//
//  NetworkTool.swift
//  LDX_SwiftBase
//
//  Created by mac on 2017/12/28.
//  Copyright © 2017年 LDX. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh
enum MethodType {
    case GET
    case POST
}
class NetworkTool {
    
    class func resquset(type: MethodType, urlString: String, paramters: [String: Any]? = nil, finishedCallback: @escaping (_ result: Any) -> ()) {
        //获取类型
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        //发送网络数据请求
        Alamofire.request(urlString, method: method, parameters: paramters).responseJSON{ (response) in
            guard let result = response.result.value else {
                
                print(response.result.error as Any)
                return
            }
            
            finishedCallback(result as AnyObject)
        }
    }
}
