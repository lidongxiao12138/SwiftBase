//
//  ShoppSectionView.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/5.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class ShoppSectionView: UBaseTableViewHeaderFooterView {

//    @IBOutlet weak var ButCoupons: UIButton!//优惠券
    
    
    @IBAction func ButCouponsClick(_ sender: UIButton) {
        //显示优惠券
        couponsView.frame = CGRect(x: 0, y:0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 100 - 64)
        self.window?.addSubview(couponsView)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        
        // Drawing code
    }
 
    
    //显示优惠券
    fileprivate lazy var couponsView: CouponsView = {
        let nibView = Bundle.main.loadNibNamed("CouponsView", owner: nil, options: nil)?.first
        return nibView as! CouponsView
    }()
}
