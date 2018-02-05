//
//  OrderBottomView.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/2.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class OrderBottomView: UIView {

    @IBAction func ButorderBottonClick(_ sender: UIButton) {
        let payorder = PayOrderViewController(); self.viewController()?.navigationController?.pushViewController(payorder, animated: true)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
