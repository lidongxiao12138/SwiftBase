//
//  MyComsionViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/24.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class MyComsionViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    let TabCellId = "MysionCellid"
    var HeadBool = true
    //MARK: ==========懒加载=========
    fileprivate lazy var mycomsionTabView: UITableView = {
        let tabView = UITableView.init(frame: CGRect(x: 0, y: 64, width:SCREEN_WIDTH, height:SCREEN_HEIGHT - 64), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        
        tabView.tableHeaderView = self.myComsionHeadView

        //        tabView.sectionHeaderHeight = 44
        
        tabView.separatorStyle = UITableViewCellSeparatorStyle.none
        return tabView
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if HeadBool == true {
            
            //团队
            self.mycomsionTabView.register(UINib.init(nibName: "MyTeamMoneyTableViewCell", bundle: nil), forCellReuseIdentifier: TabCellId)
            
            var cell = MyTeamMoneyTableViewCell()
            
            cell = mycomsionTabView.dequeueReusableCell(withIdentifier: TabCellId, for: indexPath) as! MyTeamMoneyTableViewCell
            
            return cell
        }else
        {
            //我的推荐
            self.mycomsionTabView.register(UINib.init(nibName: "MyRecMoneyTableViewCell", bundle: nil), forCellReuseIdentifier: TabCellId)
            
            var cell = MyRecMoneyTableViewCell()
            
            cell = mycomsionTabView.dequeueReusableCell(withIdentifier: TabCellId, for: indexPath) as! MyRecMoneyTableViewCell
            
            return cell
        }
        
        
        //        if indexPath.row == IndexInt {
        //            cell.LabName.backgroundColor = LDXBaseNav
        //        }else
        //        {
        //            cell.LabName.backgroundColor = .clear
        //        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return  2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if HeadBool == true {
            var sectionView = TeamHeadView()
            
            sectionView = Bundle.main.loadNibNamed("TeamHeadView", owner: nil, options: nil)?.first as! TeamHeadView
            return sectionView
        }else
        {
            var sectionView = MyRecMoneyHeadView()
            
            sectionView = Bundle.main.loadNibNamed("MyRecMoneyHeadView", owner: nil, options: nil)?.first as! MyRecMoneyHeadView
            return sectionView
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    
    //团队佣金
    lazy var teamHeadView:TeamHeadView = {
        let nibView = Bundle.main.loadNibNamed("TeamHeadView", owner: nil, options: nil)?.last
        return nibView as! TeamHeadView
    }()
    //推荐佣金
    lazy var myrecHeadView:MyRecMoneyHeadView = {
        let nibView = Bundle.main.loadNibNamed("MyRecMoneyHeadView", owner: nil, options: nil)?.last
        return nibView as! MyRecMoneyHeadView
    }()
    
    //头部视图
    lazy var myComsionHeadView:MyComsionHeadView = {
        var mycomsion = MyComsionHeadView()
        mycomsion = Bundle.main.loadNibNamed("MyComsionHeadView", owner: nil, options: nil)?.last as! MyComsionHeadView
        mycomsion.ButTeam.addTarget(self, action: #selector(butRecClick(sender:)), for: .touchUpInside)
        mycomsion.ButRec.addTarget(self, action: #selector(butRecClick(sender:)), for: .touchUpInside)
        return mycomsion
    }()
    @objc func butRecClick(sender:UIButton ) {
        if sender.tag == 1 {
            HeadBool = true
//            self.mycomsionTabView.tableHeaderView = self.teamHeadView
            mycomsionTabView.reloadData()
        }else
        {
            HeadBool = false
//            self.mycomsionTabView.tableHeaderView = self.myrecHeadView
            mycomsionTabView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "我的佣金"
        self.view.addSubview(mycomsionTabView)
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
