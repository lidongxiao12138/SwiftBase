//
//  AfterListViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/23.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class AfterListViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    let TabCellId = "AfterListCellid"
    let SectionCellId = "SectionCellid"
    //MARK: ==========懒加载=========
    fileprivate lazy var AfterListTabView: UITableView = {
        let tabView = UITableView.init(frame: CGRect(x: 0, y: 64, width:SCREEN_WIDTH, height:SCREEN_HEIGHT - 64 - 50 ), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.sectionHeaderHeight = 44
        tabView.register(UINib.init(nibName: "AfterListLTableViewCell", bundle: nil), forCellReuseIdentifier: TabCellId)
        tabView.separatorStyle = UITableViewCellSeparatorStyle.none
        return tabView
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 198
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = AfterListLTableViewCell()
        
        cell = AfterListTabView.dequeueReusableCell(withIdentifier: TabCellId, for: indexPath) as! AfterListLTableViewCell
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
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return  2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var sectionView = AfterSeationView()
        
        sectionView = Bundle.main.loadNibNamed("AfterSeationView", owner: nil, options: nil)?.first as! AfterSeationView
        return sectionView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    
    //提交申请
    lazy var butSureView:ButSureView = {
        var butSure = ButSureView()
        butSure = Bundle.main.loadNibNamed("ButSureView", owner: nil, options: nil)?.last as! ButSureView
        //提交申请
        butSure.ButSure.setTitle("联系客服", for: .normal)
        butSure.frame = CGRect(x: 0, y: SCREEN_HEIGHT-50, width:SCREEN_WIDTH, height: 50)
        //按钮
        butSure.ButSure.addTarget(self, action: #selector(butSureClick), for: .touchUpInside)
        return butSure
    }()
    @objc func butSureClick(){
        print("联系客服")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "退货/售后"
        self.view.addSubview(AfterListTabView)
        self.view.addSubview(butSureView)

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
