//
//  SepllGroupHeadView.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/1/29.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class SepllGroupHeadView: UIView {
    
    @IBOutlet weak var ButRecom: UIButton!//推荐
    
    @IBOutlet weak var ButMoney: UIButton!//价格
    
    @IBOutlet weak var ButNew: UIButton!//最新
    
    @IBOutlet weak var ButComment: UIButton!//评论
    
    @IBOutlet weak var ViewXian: UIView!//线
    
    @IBAction func ButClick(_ sender: UIButton) {
        print(sender.tag)
        switch sender.tag {
        case 1:
            ButRecom.setTitleColor(LDXBaseNav, for: .normal)
            ViewXian.center.x = ButRecom.center.x
            ButMoney.setTitleColor(.black, for: .normal)
            ButNew.setTitleColor(.black, for: .normal)
            ButComment.setTitleColor(.black, for: .normal)

        case 2:
            ButMoney.setTitleColor(LDXBaseNav, for: .normal)
            ViewXian.center.x = ButMoney.center.x
            ButRecom.setTitleColor(.black, for: .normal)
            ButNew.setTitleColor(.black, for: .normal)
            ButComment.setTitleColor(.black, for: .normal)
        case 3:
            ButNew.setTitleColor(LDXBaseNav, for: .normal)
            ViewXian.center.x = ButNew.center.x
            ButRecom.setTitleColor(.black, for: .normal)
            ButMoney.setTitleColor(.black, for: .normal)
            ButComment.setTitleColor(.black, for: .normal)
        case 4:
            ButComment.setTitleColor(LDXBaseNav, for: .normal)
            ViewXian.center.x = ButComment.center.x
            ButRecom.setTitleColor(.black, for: .normal)
            ButMoney.setTitleColor(.black, for: .normal)
            ButNew.setTitleColor(.black, for: .normal)
        default:
            break
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
