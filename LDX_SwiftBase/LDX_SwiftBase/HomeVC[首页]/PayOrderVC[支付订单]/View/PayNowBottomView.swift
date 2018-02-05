//
//  PayNowBottomView.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/2.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class PayNowBottomView: UIView {

    @IBOutlet weak var ButPayNow: UIButton!//立即支付
    @IBAction func ButPayNowClick(_ sender: UIButton) {
        let payVC = PayViewController()
        self.viewController()?.navigationController?.pushViewController(payVC, animated: true)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
