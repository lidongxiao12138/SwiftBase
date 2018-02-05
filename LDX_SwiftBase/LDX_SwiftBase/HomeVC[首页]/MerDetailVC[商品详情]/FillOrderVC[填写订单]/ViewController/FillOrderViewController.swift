//
//  FillOrderViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/1.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class FillOrderViewController: BaseViewController,UIScrollViewDelegate {

    //MARK: ==========滚动视图=========
    fileprivate lazy var orderScr : UIScrollView = {
       let scr = UIScrollView()
        scr.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64-48);
        scr.contentSize = CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        scr.isPagingEnabled = false
        scr.delegate = self
        scr.scrollsToTop = false
        return scr
    }()
    fileprivate lazy var orderView: fillorderView = {
        let nibView = Bundle.main.loadNibNamed("fillorderView", owner: nil, options: nil)?.first
        
        return nibView as! fillorderView
    }()
    fileprivate lazy var orderbottomView: OrderBottomView = {
        let nibView = Bundle.main.loadNibNamed("OrderBottomView", owner: nil, options: nil)?.first
        
        return nibView as! OrderBottomView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "填写订单"
        self.view.addSubview(orderScr)
        orderbottomView.frame = CGRect(x: 0, y: SCREEN_HEIGHT-48, width: SCREEN_WIDTH, height: 48)
        self.view.addSubview(orderbottomView)
        orderView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        orderScr.addSubview(orderView)

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
