//
//  EditorView.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/6.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class EditorView: UIView {

    @IBOutlet weak var ButClose: UIButton!//删除
    @IBOutlet weak var ButSouCang: UIButton!//收藏
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        ViewRaidusBorWidth(View: ButSouCang, Radius: 12, BorWidth: 1, Color: RLDXBaseNav)
        ViewRaidusBorWidth(View: ButClose, Radius: 12, BorWidth: 1, Color: UIColor.red.cgColor)
        // Drawing code
    }
    

}
