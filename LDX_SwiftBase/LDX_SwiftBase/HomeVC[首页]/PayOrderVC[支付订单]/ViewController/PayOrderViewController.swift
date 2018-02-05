//
//  PayOrderViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/2.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class PayOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "支付订单"
        self.payorderView.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        self.view.addSubview(payorderView)
        self.paynowBottomiew.frame = CGRect(x: 0, y: SCREEN_HEIGHT-48, width: SCREEN_WIDTH, height: 48)
        self.view.addSubview(paynowBottomiew)
        // Do any additional setup after loading the view.
    }
    // 支付
    fileprivate lazy var payorderView: payView = {
        let nibView = Bundle.main.loadNibNamed("payView", owner: nil, options: nil)?.first

        return nibView as! payView
    }()
    // 立即支付
    fileprivate lazy var paynowBottomiew: PayNowBottomView = {
        let nibView = Bundle.main.loadNibNamed("PayNowBottomView", owner: nil, options: nil)?.first
        
        return nibView as! PayNowBottomView
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
