//
//  HeadTextView.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/1/27.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class HeadTextView: UIView {

    @IBOutlet weak var ButNor: UIButton!//默认
    
    @IBOutlet weak var ButTime: UIButton!//时间
    
    @IBOutlet weak var ButValue: UIButton!//面值
    
    @IBOutlet weak var ViewXian: UIView!//线
    
    @IBOutlet weak var ImageTime: UIImageView!//时间的旁边图片
    
    @IBOutlet weak var ImageValue: UIImageView!//面值旁边的图片
    
    
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        
        
        // Drawing code
    }
    
    @IBAction func ButClick(_ sender: UIButton) {
        print(sender.tag)
        switch sender.tag {
        case 1:
            ButNor.setTitleColor(LDXBaseNav, for: .normal)
            ViewXian.center.x = ButNor.center.x
            ButTime.setTitleColor(.black, for: .normal)
            ButValue.setTitleColor(.black, for: .normal)
        case 2:
            ButTime.setTitleColor(LDXBaseNav, for: .normal)
            ViewXian.center.x = ButTime.center.x
            ButNor.setTitleColor(.black, for: .normal)
            ButValue.setTitleColor(.black, for: .normal)
        case 3:
            ButValue.setTitleColor(LDXBaseNav, for: .normal)
            ViewXian.center.x = ButValue.center.x
            ButNor.setTitleColor(.black, for: .normal)
            ButTime.setTitleColor(.black, for: .normal)
        default:
            break
        }
    }
    
}
