//
//  MerDetailViewController.swift
//  LDX_SwiftBase
//
//  Created by 掌心 on 2018/1/16.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit
import HMSegmentedControl
class MerDetailViewController: UIViewController {

    //MAEK:=========== 进入程序 =============
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.detailSegment.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.navigationItem.title = ""
        
        self.navigationController?.navigationBar.addSubview(self.detailSegment)
        self.detailSegment.center.x = (self.navigationController?.navigationBar.center.x)!
        
        //详情
        self.detailSegment.ButDetail.addTarget(self, action: #selector(ButDetailClick(sender:)), for: .touchUpInside)
        //商品
        self.detailSegment.ButGoods.addTarget(self, action: #selector(ButDetailClick(sender:)), for: .touchUpInside)
        //评价
        self.detailSegment.ButComment.addTarget(self, action: #selector(ButDetailClick(sender:)), for: .touchUpInside)
    
    }
  

    fileprivate lazy var detailSegment: DetailSegmentView = {
        let nibView = Bundle.main.loadNibNamed("DetailSegmentView", owner: nil, options: nil)?.first

        return nibView as! DetailSegmentView
    }()
    
    @objc func ButDetailClick(sender:UIButton){
        print(sender.tag)
        switch sender.tag {
        case 0:
        self.detailSegment.ViewBackground.center.x = self.detailSegment.ButGoods.center.x
        self.detailSegment.ButGoods.setTitleColor(LDXBaseNav, for: .normal)
        self.detailSegment.ButComment.setTitleColor(.black, for: .normal)
        self.detailSegment.ButDetail.setTitleColor(.black, for: .normal)

            
        case 1:
        self.detailSegment.ViewBackground.center.x = self.detailSegment.ButComment.center.x
        self.detailSegment.ButComment.setTitleColor(LDXBaseNav, for: .normal)
        self.detailSegment.ButGoods.setTitleColor(.black, for: .normal)
        self.detailSegment.ButDetail.setTitleColor(.black, for: .normal)

        case 2:
        self.detailSegment.ViewBackground.center.x = self.detailSegment.ButDetail.center.x
        self.detailSegment.ButDetail.setTitleColor(LDXBaseNav, for: .normal)
        self.detailSegment.ButGoods.setTitleColor(.black, for: .normal)
        self.detailSegment.ButComment.setTitleColor(.black, for: .normal)

        default:
            break
        }
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


