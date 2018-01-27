//
//  HomeHeadView.swift
//  LDX_SwiftBase
//
//  Created by mac on 2018/1/3.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class HomeHeadView: UBaseCollectionReusableView {
    @IBOutlet weak var ViewImageRoll: UIView!//滚动图片
    
    @IBOutlet weak var viewLabRoll: UIView!//滚动视图
    
    @IBOutlet weak var ButRecMer1: UIButton!//商家1
   
    @IBOutlet weak var ButRecMer2: UIButton!//商家2
    
    @IBOutlet weak var ButRecMer3: UIButton!
    //商家3
    
    @IBOutlet weak var ButMore: UIButton!//更多
    
    @IBOutlet weak var ButBorDis: UIButton!//领取优惠
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        load_init()
    }

    func load_init(){

    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        Ridus(Rview: ButRecMer1, Ridus: 3)
        Ridus(Rview: ButRecMer2, Ridus: 3)
        Ridus(Rview: ButRecMer3, Ridus: 3)
       
        ButMore.addTarget(self, action: #selector(ButMoreClick), for: .touchUpInside)
        
        ButBorDis.addTarget(self, action: #selector(ButBorDisClick), for: .touchUpInside)
        
        // Drawing code
    }
    
    @objc func ButMoreClick(){
        let webView = WebViewController()
        self.viewController()?.navigationController?.pushViewController(webView, animated: true)
    }
    
    @objc func ButBorDisClick(){
        let borDis = BroDisViewController()
        self.viewController()?.navigationController?.pushViewController(borDis, animated: true)
    }
}



 

