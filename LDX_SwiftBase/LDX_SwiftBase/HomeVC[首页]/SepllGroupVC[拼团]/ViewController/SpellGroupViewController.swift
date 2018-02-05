//
//  SpellGroupViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/1/29.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class SpellGroupViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let CellId:String = "cellid"
    //MAEK:=========== 进入程序 =============
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        //加载头部视图
        navCenter.frame = CGRect(x: 40*d_width, y: 7, width: 280*d_width, height: 29);
        navCenter.center.x = (self.navigationController?.navigationBar.center.x)!
        self.navigationController?.navigationBar.addSubview(self.navCenter)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navCenter.removeFromSuperview()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sepllgrouphead.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 45)

        self.view.addSubview(sepllgrouphead)
        
        self.view.addSubview(SpellGroupTab)

        self.navCenter.ButNav.addTarget(self, action: #selector(navClick), for: .touchUpInside)

        
        //添加导航栏右侧
        CreatNavRight()
        // Do any additional setup after loading the view.
    }
    
    @objc func navClick() {
        print("跳转")
        self.navCenter.removeFromSuperview()
        let searchVC = SearchItemsViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    func CreatNavRight(){
        let image:UIImage = UIImage(named: "nav_5_2_class")!
        let bar = UIBarButtonItem.init(image: image.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: .plain, target: self, action: #selector(NavClick))
        navigationItem.rightBarButtonItem = bar
    }
    //按钮事件
    @objc func NavClick(){
        let sortingVC = SortingViewController()
        self.navigationController?.pushViewController(sortingVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 286
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = SepllGroupTableViewCell()
        
        cell = SpellGroupTab.dequeueReusableCell(withIdentifier: CellId, for: indexPath) as! SepllGroupTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let SepComVC = SepllDetailViewController()
        self.navigationController?.pushViewController(SepComVC, animated: true)
        
        //清除头部
        self.navCenter.removeFromSuperview()

        print(indexPath)
    }
    //MARK: ==========创建TabView + 懒加载=========
    lazy var SpellGroupTab : UITableView = {
        let tabView = UITableView.init(frame: CGRect(x:0, y:64+45, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64-45), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.backgroundColor = .clear
        tabView.separatorStyle = UITableViewCellSeparatorStyle.none
        tabView.register(UINib.init(nibName: "SepllGroupTableViewCell", bundle: nil), forCellReuseIdentifier: CellId)
        return tabView
    }()

    //头部视图
    fileprivate lazy var sepllgrouphead: SepllGroupHeadView = {
        let nibView = Bundle.main.loadNibNamed("SepllGroupHeadView", owner: nil, options: nil)?.first
        
        return nibView as! SepllGroupHeadView
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
