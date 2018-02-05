//
//  BuyShowView.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/1.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class BuyShowView: UIView {

    @IBAction func ButClose(_ sender: UIButton) {
        print("应该消失")
        self.removeFromSuperview()

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromSuperview()
    }
    @IBAction func ButfillOrder(_ sender: UIButton) {
        let fillorder = FillOrderViewController()
    self.viewController()?.navigationController?.pushViewController(fillorder, animated: true)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
