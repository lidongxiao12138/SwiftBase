//
//  LDXSendForumTypeView.swift
//  LDX_SwiftBase
//
//  Created by cherry pu on 2018/2/8.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class LDXSendForumTypeView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private var lastButton:UIButton = UIButton.init()
    
    convenience init(typeArray: NSArray, frame: CGRect) {
        self.init(frame: frame)
        
        var i = 0
        while i<typeArray.count {
            let button:UIButton = UIButton.init()
            let type:String = typeArray[i] as! String
            button.setTitle(type, for: .normal)
            button.setTitleColor(RGBColor(r: 153, g: 153, b: 153), for: .normal)
            button.titleLabel?.font = UIFont.lf_systemFont(ofSize: 12)
            button.setTitleColor(RGBColor(r: 236, g: 189, b: 80), for: .selected)
            button.setBackgroundImage(UIImage.init(named: "RoundAngle")?.withRenderingMode(.alwaysTemplate), for: .normal)
            button.tintColor = RGBColor(r: 221, g: 221, b: 221)
            button.setBackgroundImage(UIImage.init(named: "RoundAngle"), for: .selected)
            button.backgroundColor = UIColor.white
            button.tag = i
            button.addTarget(self, action:#selector(handleClickTypeButton(button:)), for: .touchUpInside)
            self.addSubview(button)
            
            button.snp.makeConstraints({ (make) in
                make.top.equalTo(self)
                if i==0 {
                    make.left.equalTo(self).offset(UIView.lf_size(fromIphone6: 12))
                }else {
                    make.left.equalTo(self.lastButton.snp.right).offset(UIView.lf_size(fromIphone6: 10))
                }
            make.size.equalTo(CGSize(width:button.intrinsicContentSize.width+UIView.lf_size(fromIphone6: 20),height:UIView.lf_size(fromIphone6: 22)))
                self.lastButton = button
            })
            
            if i == (typeArray.count - 1) {
                self.snp.makeConstraints({ (make) in
                    make.right.equalTo(button.snp.right)
                })
            }
            i += 1
        }
    }

    @objc func handleClickTypeButton(button:UIButton) {
        button.isSelected = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
