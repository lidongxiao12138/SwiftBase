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
import MJRefresh//下拉刷新
import JQProgressHUD//小菊花

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    let Cellid = "Cell"
    let headerIdentifier = "CollectionReusableViewHeader"
    var dataArr = [HomeModel]()
    var imageArr = [HomeModel]()
    
    //MAEK:=========== 创建Collection ==============

    fileprivate lazy var homeCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 173*d_width ,height: 245)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 5
        layout.headerReferenceSize = self.homeheadView.size

        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        let homecollection = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64), collectionViewLayout: layout)
        homecollection.delegate = self
        homecollection.dataSource = self
        homecollection.backgroundColor = .white
        weak var weakself = self
        homecollection.mj_header = MJRefreshNormalHeader.init(){
            self.dataArr = [HomeModel]()
            self.imageArr = [HomeModel]()
            weakself?.requsethome()
        }
        //cell注册
        homecollection.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Cellid)
        
        //注册一个headView
        homecollection.register(UINib.init(nibName: "HomeHeadView",bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        return homecollection
    }()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.homeCollection.dequeueReusableCell(withReuseIdentifier:Cellid, for: indexPath)
    
        return cell
    }
    //这个是设定header和footer的方法，根据kind不同进行不同的判断即可

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableView :UICollectionReusableView?
        if kind == UICollectionElementKindSectionHeader
        {
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath)
            
            reusableView?.addSubview(self.homeheadView)
            
        }
        return reusableView!

    }
    
    //MARK:=========== 加载头部视图 ==============
    fileprivate lazy var homeheadView: HomeHeadView = {
        return HomeHeadView.homeView()!
    }()
    
    
//    MARK:=========== 轮播图 ==============
        func loadCycleView() {
        var urlArr = [String]()
        for homeMo in self.imageArr
        {
            urlArr.append(homeMo.image!)
            print(homeMo.image!)
        }
        let cycleView = SQAutoScrollView(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 190), urls: urlArr , didItemCallBack: { (view, index) in
//            var homeMo = HomeModel.init()
//            homeMo = self.imageArr[index]
//
//            let webview = WebViewController()
//            self.navigationController?.pushViewController(webview, animated: true)

//            print(homeMo.url!)
        })
        cycleView.backgroundColor = .red
        cycleView.pageControl?.pageIndicatorTintColor = .gray
        cycleView.pageControl?.currentPageIndicatorTintColor = .white
        self.homeheadView.ViewImageRoll.addSubview(cycleView)
        self.homeheadView.ViewImageRoll.insertSubview(cycleView, at: 0)
    }
    
    
    
    
    

    //MARK:----------- 数据加载接口
    func requsethome()
    {
        
        JQProgressHUDTool.jq_showNormalHUD()
        
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
                    self.view.addSubview(self.homeCollection)

                    //MARK:=========== 加载轮播图 ==============
                    self.loadCycleView()
                    
                    //MARK:=========== 取消小菊花 ==============
                    self.homeCollection.reloadData()
                    
                }
                print("获取数据成功")
            case false:
                //MARK:=========== 取消小菊花 ==============
                JQProgressHUDTool.jq_hideHUD()
                JQProgressHUDTool.jq_showNormalHUD(msg:"网络错误")
                print(response.result.error as Any)
            }
            JQProgressHUDTool.jq_hideHUD()
            self.homeCollection.mj_header.endRefreshing()
        }
    }
    
    
    //MAEK:=========== 进入程序 ==============

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //加载数据接口
        requsethome()
        
        navigationItem.titleView = nil;
        navigationItem.title = "首页"

        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}











