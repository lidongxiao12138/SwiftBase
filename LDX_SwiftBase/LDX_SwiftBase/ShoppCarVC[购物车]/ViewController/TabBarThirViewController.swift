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

    //MARK: ==========懒加载=========
    fileprivate lazy var ShoppingTabView: UITableView = {
        let tabView = UITableView.init(frame: CGRect(x: 0, y: 64, width:SCREEN_WIDTH, height:SCREEN_HEIGHT-64 ), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.sectionHeaderHeight = 44
        tabView.register(UINib.init(nibName: "ShoppingTableViewCell", bundle: nil), forCellReuseIdentifier: TabCellId)
        tabView.separatorStyle = UITableViewCellSeparatorStyle.none
        return tabView
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
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
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return self.shoppSectionview
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view = self.shoppSectionview
        view = ShoppingTabView.dequeueReusableHeaderFooterView(withIdentifier: SectionCellId) as! ShoppSectionView
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    
    //Sectionshopp
    fileprivate lazy var shoppSectionview: ShoppSectionView = {
        let nibView = Bundle.main.loadNibNamed("ShoppSectionView", owner: nil, options: nil)?.first
        
        return nibView as! ShoppSectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.ShoppingTabView)
        // Do any additional setup after loading the view.
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
