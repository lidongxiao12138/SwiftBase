//
//  SortingViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/1/30.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class SortingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {

    let TabCellId = "SortingCellid"
    let CollectCellId = "CollectCellid"
    let CollectionViewHeaderView = "CollectionViewHeaderView"
    var IndexInt = Int()
    
    //MAEK:=========== 进入程序 =============
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        //加载头部视图
        navCenter.frame = CGRect(x: 40*d_width, y: 7, width: 280*d_width, height: 29);
        navCenter.center.x = (self.navigationController?.navigationBar.center.x)!
        self.navigationController?.navigationBar.addSubview(self.navCenter)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navCenter.removeFromSuperview()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.view.addSubview(SortingTabView)
        self.view.addSubview(SortCollectView)

        CreatNavRight()
        // Do any additional setup after loading the view.
    }
    func CreatNavRight(){
        let but = UIButton.init(type: .custom)
        but.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        but.setTitle("搜索", for: .normal)
        but.addTarget(self, action: #selector(NavClick), for: .touchUpInside)
        but.setTitleColor(.black, for: .normal)
        but.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        but.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        but.sizeToFit()
        let bar = UIBarButtonItem.init(customView: but)
        navigationItem.rightBarButtonItem = bar
    }
    //按钮事件
    @objc func NavClick(){
        print("搜索按钮")
    }
    
    //MARK: ==========懒加载=========
    fileprivate lazy var SortingTabView: UITableView = {
        let tabView = UITableView.init(frame: CGRect(x: 0, y: 64, width:85, height:SCREEN_HEIGHT-64 ), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.register(UINib.init(nibName: "SortingTableViewCell", bundle: nil), forCellReuseIdentifier: TabCellId)
        tabView.separatorStyle = UITableViewCellSeparatorStyle.none
        return tabView
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = SortingTableViewCell()
        
        cell = SortingTabView.dequeueReusableCell(withIdentifier: TabCellId, for: indexPath) as! SortingTableViewCell
        if indexPath.row == IndexInt {
            cell.LabName.backgroundColor = LDXBaseNav
        }else
        {
            cell.LabName.backgroundColor = .clear
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        IndexInt = indexPath.row
        SortingTabView.reloadData()
    }
    //MARK: ==========创建CollectView=========
    fileprivate lazy var SortCollectView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 70 ,height: 90)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 5
        layout.headerReferenceSize = self.headSecView.size
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
        let collection = UICollectionView(frame: CGRect.init(x: 85, y: 64, width: SCREEN_WIDTH-85, height: SCREEN_HEIGHT-64), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
//        weak var weakself = self
//        homecollection.mj_header = MJRefreshNormalHeader.init(){
//            self.dataArr = [HomeModel]()
//            self.imageArr = [HomeModel]()
//            weakself?.requsethome()
//        }
        //cell注册
        collection.register(UINib.init(nibName: "SortingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CollectCellId)
        collection.register(UINib.init(nibName: "HeadSectionView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: CollectionViewHeaderView)

        return collection
    }()
    //设置section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 290, height: 45)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reuseIdentifier : String?
        if kind == UICollectionElementKindSectionHeader {
            reuseIdentifier = CollectionViewHeaderView
        }
        var view = headSecView
        
        view = SortCollectView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseIdentifier!, for: indexPath) as! HeadSectionView
        
        if kind == UICollectionElementKindSectionHeader {
            //            let model = dataSource[indexPath.section]
            //            view.setDatas(model)
        }
        return view
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = SortingCollectionViewCell()
        cell = self.SortCollectView.dequeueReusableCell(withReuseIdentifier:CollectCellId, for: indexPath) as! SortingCollectionViewCell
        return cell
    }
    //点击事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath)
    }
    
    //Section头部视图
    fileprivate lazy var headSecView: HeadSectionView = {
        let nibView = Bundle.main.loadNibNamed("HeadSectionView", owner: nil, options: nil)?.first
        
        return nibView as! HeadSectionView
    }()
    
    //nav按钮
    fileprivate lazy var navCenter: NavCenterView = {
        let nibView = Bundle.main.loadNibNamed("NavCenterView", owner: nil, options: nil)?.first
        
        return nibView as! NavCenterView
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
