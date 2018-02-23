//
//  TabBarThirViewController.swift
//  LDX_SwiftBase
//
//  Created by mac on 2017/12/22.
//  Copyright © 2017年 LDX. All rights reserved.
//

import UIKit

class TabBarThirViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    let TabCellId = "SortingCellid"
    let SectionCellId = "SectionCellid"
    var isEditor = false

    //MARK: ==========懒加载=========
    fileprivate lazy var ShoppingTabView: UITableView = {
        let tabView = UITableView.init(frame: CGRect(x: 0, y: 64, width:SCREEN_WIDTH, height:SCREEN_HEIGHT-64 - 49 - 50 ), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.sectionHeaderHeight = 44
        tabView.register(UINib.init(nibName: "ShoppingTableViewCell", bundle: nil), forCellReuseIdentifier: TabCellId)
        tabView.separatorStyle = UITableViewCellSeparatorStyle.none
        return tabView
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return  2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = ShoppingTableViewCell()
        
        cell = ShoppingTabView.dequeueReusableCell(withIdentifier: TabCellId, for: indexPath) as! ShoppingTableViewCell
//        if indexPath.row == IndexInt {
//            cell.LabName.backgroundColor = LDXBaseNav
//        }else
//        {
//            cell.LabName.backgroundColor = .clear
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func numberOfSections(in tableView: UITableView) -> Int {

        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let nibView = Bundle.main.loadNibNamed("ShoppSectionView", owner: nil, options: nil)?.first
        return nibView as! ShoppSectionView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    //购物底部
    fileprivate lazy var shoppBottomView: ShoppingBottomView = {
        let nibView = Bundle.main.loadNibNamed("ShoppingBottomView", owner: nil, options: nil)?.first
        return nibView as! ShoppingBottomView
    }()
    //编辑按钮
    fileprivate lazy var editorView: EditorView = {
        let nibView = Bundle.main.loadNibNamed("EditorView", owner: nil, options: nil)?.first
        return nibView as! EditorView
    }()

    //购物车无内容
    fileprivate lazy var noShopView: NoShopView = {
        let nibView = Bundle.main.loadNibNamed("NoShopView", owner: nil, options: nil)?.first
        return nibView as! NoShopView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: ==========购物车无商品时显示=========
        noShopView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        self.view.addSubview(noShopView)
        //MARK: ==========购物车有商品时=========
//        //编辑View
//        editorView.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 44)
//        self.view.addSubview(editorView)
//        //tabView创建
//        ShoppingTabView.register(ShoppSectionView.self, forHeaderFooterViewReuseIdentifier: SectionCellId)
//        self.view.addSubview(self.ShoppingTabView)
//        //添加购物车
//        shoppBottomView.frame = CGRect(x: 0, y: SCREEN_HEIGHT-49-50, width: SCREEN_WIDTH, height: 50)
//        self.view.addSubview(shoppBottomView)
        
        
        
       
        
        //添加右部编辑
        CreatNavRight()
        // Do any additional setup after loading the view.
    }

    func CreatNavRight(){
        let but = UIButton.init(type: .custom)
        but.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        but.setTitle("编辑", for: .normal)
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
        print("编辑按钮")
        self.ShoppingTabView.origin = CGPoint(x: 0, y: 64 + 44)
        if isEditor == false {
            self.ShoppingTabView.origin = CGPoint(x: 0, y: 64 + 44)
            isEditor = true
        }else
        {
            self.ShoppingTabView.origin = CGPoint(x: 0, y: 64)
            isEditor = false
        }
    }
    
    
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
