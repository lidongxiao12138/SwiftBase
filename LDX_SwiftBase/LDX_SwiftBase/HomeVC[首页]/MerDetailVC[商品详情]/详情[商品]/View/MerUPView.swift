//
//  MerUPView.swift
//  LDX_SwiftBase
//
//  Created by 李东晓 on 2018/1/23.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class MerUPView: UIView {
    @IBOutlet weak var ImageRolling: UIView!
    
    @IBOutlet weak var ButStore: UIButton!//进入店铺
    
    @IBOutlet weak var ButWithService: UIButton!//联系客服
    
    @IBAction func ButStoreClick(_ sender: UIButton) {
        let goStoreVC = GoStoreViewController()
        self.viewController()?.navigationController?.pushViewController(goStoreVC, animated: true)
    }
    
    @IBAction func ButWithServiceClick(_ sender: UIButton) {
        
    }
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        ViewRaidusBorWidth(View: ButStore, Radius: 15, BorWidth: 1, Color: RLDXBaseNav)
        ViewRaidusBorWidth(View: ButWithService, Radius: 15, BorWidth: 1, Color: RLDXBaseNav)
        // Drawing code
    }
 

}
