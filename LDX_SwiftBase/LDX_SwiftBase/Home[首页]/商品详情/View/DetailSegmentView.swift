//
//  DetailSegmentView.swift
//  LDX_SwiftBase
//
//  Created by 掌心 on 2018/1/16.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class DetailSegmentView: UIView {
    @IBOutlet weak var ButGoods: UIButton!//商品
    @IBOutlet weak var ButComment: UIButton!//评价
    @IBOutlet weak var ButDetail: UIButton!//详情
    @IBOutlet weak var ViewBackground: UIView!//背景
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        load_init()
    }
    
    func load_init(){
        
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }

    
    
    

}
