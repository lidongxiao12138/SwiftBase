//
//  MyRecViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/24.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class MyRecViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    let TabCellId = "MyRecCellid"
    //MARK: ==========懒加载=========
    fileprivate lazy var myRecTabView: UITableView = {
        let tabView = UITableView.init(frame: CGRect(x: 0, y: 64, width:SCREEN_WIDTH, height:SCREEN_HEIGHT - 64), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.tableHeaderView = self.recomView
        //        tabView.sectionHeaderHeight = 44
        tabView.register(UINib.init(nibName: "MyRecTableViewCell", bundle: nil), forCellReuseIdentifier: TabCellId)
        tabView.separatorStyle = UITableViewCellSeparatorStyle.none
        return tabView
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = MyRecTableViewCell()
        
        cell = myRecTabView.dequeueReusableCell(withIdentifier: TabCellId, for: indexPath) as! MyRecTableViewCell
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "我的推荐"
        self.view.addSubview(myRecTabView)
        // Do any additional setup after loading the view.
    }
    //我的推荐头视图
    lazy var recomView:RecomView = {
        let nibView = Bundle.main.loadNibNamed("RecomView", owner: nil, options: nil)?.last
        return nibView as! RecomView
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
