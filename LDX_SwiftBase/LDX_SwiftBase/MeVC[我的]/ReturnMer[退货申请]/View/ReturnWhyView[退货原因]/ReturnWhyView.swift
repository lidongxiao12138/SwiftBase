//
//  ReturnWhyView.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/7.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class ReturnWhyView: UIView,UITableViewDelegate,UITableViewDataSource {
    let TabCellId = "ReturnWhyCellid"

    @IBOutlet weak var ViewWhySeleted: UIView!//选择
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        ViewWhySeleted.addSubview(RetWhyTabView)
    }
    
    //MARK: ==========懒加载=========
    fileprivate lazy var RetWhyTabView: UITableView = {
        let tabView = UITableView.init(frame: CGRect(x: 0, y: 0, width:SCREEN_WIDTH, height:ViewWhySeleted.frame.size.height), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.register(UINib.init(nibName: "ReturnWhyTableViewCell", bundle: nil), forCellReuseIdentifier: TabCellId)
        tabView.separatorStyle = UITableViewCellSeparatorStyle.none
        return tabView
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = ReturnWhyTableViewCell()
        
        cell = RetWhyTabView.dequeueReusableCell(withIdentifier: TabCellId, for: indexPath) as! ReturnWhyTableViewCell
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromSuperview()
    }
    @IBAction func ButCloseClick(_ sender: UIButton) {
        self.removeFromSuperview()
    }
}
