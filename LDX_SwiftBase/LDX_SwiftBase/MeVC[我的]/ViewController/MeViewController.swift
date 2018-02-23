//
//  MeViewController.swift
//  LDX_SwiftBase
//
//  Created by mac on 2017/12/22.
//  Copyright © 2017年 LDX. All rights reserved.
//

import UIKit
import Alamofire//数据
import SwiftyJSON//类型转译
import MJRefresh//下拉刷新
import JQProgressHUD//小菊花
class MeViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    let Cellid = "Cell"
    let headerIdentifier = "CollectionReusableViewHeader"
    var ImageArr = [String]()
    var TitleArr = [String]()
    //MAEK:=========== 创建Collection ==============
    
    lazy var meCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 101*d_width ,height: 101)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.headerReferenceSize = meheadView.size
        
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 20*d_width, bottom: 0, right: 20*d_width)
        let meCollection = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-44), collectionViewLayout: layout)
        meCollection.delegate = self
        meCollection.dataSource = self
        meCollection.backgroundColor = .white
        //下啦刷新
//        weak var weakself = self
//        homecollection.mj_header = MJRefreshNormalHeader.init(){
//            self.dataArr = [HomeModel]()
//            self.imageArr = [HomeModel]()
//            weakself?.requsethome()
//        }
        //cell注册
        meCollection.register(UINib.init(nibName: "MeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Cellid)
        
        //注册一个headView
        meCollection.register(UINib.init(nibName: "MeHeadView",bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        return meCollection
    }()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var meCell = MeCollectionViewCell()
        meCell = self.meCollection.dequeueReusableCell(withReuseIdentifier:Cellid, for: indexPath) as! MeCollectionViewCell
        meCell.ImageTitle.image = UIImage(named: ImageArr[indexPath.row])
        meCell.LabTitle.text = TitleArr[indexPath.row]
        return meCell
    }
    //点击事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            let myexchange = MyExchangeViewController()
            navigationController?.pushViewController(myexchange, animated: true)
        }
        if indexPath.row == 5 {
            let myrecomVC = MyRecViewController()
            navigationController?.pushViewController(myrecomVC, animated: true)
        }
        if indexPath.row == 6 {
            let myMoney = MyComsionViewController()
            navigationController?.pushViewController(myMoney, animated: true)
        }

        
        print(indexPath)
    }
    
    //这个是设定header和footer的方法，根据kind不同进行不同的判断即可
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader
        {
            self.meheadView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as! MeHeadView
        }
        return self.meheadView
    }
    //MAEK:=========== 进入程序 ==============
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ImageArr = ["Me_4_1_xiaoxi-","Me_4_2_sehqu","Me_4_3_shc","Me_4_4_sch","Me_4_5_duihuan","Me_4_6_tj","Me_4_7_yj","Me_4_8_qy","Me_4_9_address"]
        
        TitleArr = ["我的消息","我的社区","我的手收藏","积分商城","我的兑换","我的推荐","我的佣金","我的权益","收货地址"]
        //MARK: ==========进入登录页面=========
        let loginVc = LoginViewController(nibName: "LoginViewController", bundle: nil)
        let loginNaviController = MainNavigationController(rootViewController: loginVc as UIViewController)
        present(loginNaviController, animated: true) {() -> Void in }
        

        self.automaticallyAdjustsScrollViewInsets = false
        
        self.view.addSubview(self.meCollection)
        // Do any additional setup after loading the view.
    }
   
    //MARK:=========== 加载头部视图 ==============
    
    lazy var meheadView:MeHeadView = {
        let nibView = Bundle.main.loadNibNamed("MeHeadView", owner: nil, options: nil)?.last
        return nibView as! MeHeadView
    }()

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
