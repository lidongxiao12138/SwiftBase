//
//  CouponsView.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/6.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class CouponsView: UIView,UITableViewDelegate,UITableViewDataSource {
    let TabCellId = "CouponsCellid"

    @IBOutlet weak var ButClose: UIButton!//取消按钮
    
    @IBOutlet weak var ViewCouponsTab: UIView!//添加TabView的视图
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.backgroundColor = .clear
        
        ViewCouponsTab.addSubview(CouponsTabView)
        // Drawing code
    }
    @IBAction func ButCloseClick(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromSuperview()
    }
    
    //MARK: ==========懒加载=========
    fileprivate lazy var CouponsTabView: UITableView = {
        let tabView = UITableView.init(frame: CGRect(x: 0, y: 64, width:SCREEN_WIDTH, height:ViewCouponsTab.frame.size.height), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.register(UINib.init(nibName: "CouponsTableViewCell", bundle: nil), forCellReuseIdentifier: TabCellId)
        tabView.separatorStyle = UITableViewCellSeparatorStyle.none
        return tabView
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = CouponsTableViewCell()
        
        cell = CouponsTabView.dequeueReusableCell(withIdentifier: TabCellId, for: indexPath) as! CouponsTableViewCell
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
    
    

}
