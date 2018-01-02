//
//  HomeViewController.swift
//  LDX_SwiftBase
//
//  Created by mac on 2017/12/22.
//  Copyright © 2017年 LDX. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MJRefresh


class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let Cellid = "Cell"
    var dataArr = [HomeModel]()
    
    fileprivate lazy var hometableView: UITableView = {
        let hometableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: UITableViewStyle.plain)
        hometableView.delegate = self
        hometableView.dataSource = self
        weak var weakself = self
        hometableView.mj_header = MJRefreshNormalHeader.init(){
            self.dataArr = [HomeModel]()
            weakself?.requsethome()
        }
        //去除tableView 多余行的方法 添加一个tableFooterView 后面多余行不再显示
        hometableView.tableFooterView = UIView()
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil) //nibName指的是我们创建的Cell文件名
        hometableView.register(nib, forCellReuseIdentifier: Cellid)
        return hometableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = hometableView.dequeueReusableCell(withIdentifier: self.Cellid, for: indexPath) as! HomeTableViewCell
        var homeMo = HomeModel.init()
            homeMo = self.dataArr[indexPath.row]
            cell.configCellWithStatusModel(model: homeMo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)//点击完成，取消高亮

        print(indexPath.row)
    }
    

    //MARK:----------- 首页数据加载接口
    func requsethome()
    {

        let params:Dictionary = ["sign" : kSignName]
        let UrlStr = kIPAddress+kPointUrl
        print(UrlStr)
        Alamofire.request(UrlStr, method: .post, parameters: params).responseJSON { (response) in
            switch response.result.isSuccess {
            case true:
        
                let jsonStr = JSON.init(response.result.value as Any)
                if let items = jsonStr["data"]["announce"].array {
                    //遍历数组得到每一个字典模型
                    for dictt in items{
//                        let user = JSONKey.valueForKey(dictt) as! [AnyObject]
                        let homemodel = HomeModel()
                        homemodel.car_number = dictt["name"].string ?? ""
                        self.dataArr.append(homemodel)
                        
                        print(dictt["name"].string as Any)
                    }
                    
                    self.hometableView.reloadData()
                }
                print("获取数据成功")
            case false:
                self.noticeOnlyText("网络错误")
                print(response.result.error as Any)
            }
            
            self.hometableView.mj_header.endRefreshing()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载数据接口
        requsethome()
        navigationItem.titleView = nil;
        navigationItem.title = "首页"
        view.addSubview(hometableView)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}






