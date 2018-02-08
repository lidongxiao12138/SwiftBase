//
//  LDXSendCommentView.swift
//  LDX_SwiftBase
//
//  Created by cherry pu on 2018/2/8.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class LDXSendCommentView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpSendView()
    }
    
    public var sendTextField:UITextField = UITextField.init()
    
    func setUpSendView() {
        self.backgroundColor = RGBColor(r: 242, g: 242, b: 242)
        
        let textfield:UITextField = UITextField.init()
        textfield.placeholder = "评论"
        textfield.font = UIFont.lf_systemFont(ofSize: 13)
        textfield.textColor = RGBColor(r: 51, g: 51, b: 51)
        textfield.layer.cornerRadius = UIView.lf_size(fromIphone6: 2)
        textfield.layer.masksToBounds = true
        textfield.backgroundColor = UIColor.white
        self.sendTextField = textfield
        self.addSubview(textfield)
        
        textfield.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(UIView.lf_size(fromIphone6: 12))
            make.right.equalTo(self).offset(UIView.lf_size(fromIphone6: -73))
            make.height.equalTo(UIView.lf_size(fromIphone6: 32))
        }
        
        let sendButton:UIButton = UIButton.init()
        sendButton.setTitle("发送", for: .normal)
        sendButton.titleLabel?.font = UIFont.lf_systemFont(ofSize: 13)
        sendButton.setTitleColor(RGBColor(r: 51, g: 51, b: 51), for: .normal)
        sendButton.backgroundColor = RGBColor(r: 236, g: 189, b: 80)
        sendButton.layer.cornerRadius = UIView.lf_size(fromIphone6: 4)
        sendButton.layer.masksToBounds = true
        self.addSubview(sendButton)
        
        sendButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(UIView.lf_size(fromIphone6: -13))
            make.size.equalTo(CGSize(width:UIView.lf_size(fromIphone6: 50),height:UIView.lf_size(fromIphone6: 32)))
        }
    }
}
