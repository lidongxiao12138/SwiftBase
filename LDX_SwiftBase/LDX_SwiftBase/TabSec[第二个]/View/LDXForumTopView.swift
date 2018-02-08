//
//  LDXForumTopView.swift
//  LDX_SwiftBase
//
//  Created by cherry pu on 2018/2/7.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit
import SnapKit

protocol LDXForumTopViewDelegate:NSObjectProtocol
{
    func topViewClickBackButton()
}

class LDXForumTopView: UIView {
    
    weak open var delegate: LDXForumTopViewDelegate?
    
    private var line:UIView = UIView.init()
    private var selectButton:UIButton = UIButton.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupForumTopView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func handleClickBackButton()  {
        if self.delegate != nil
        {
            self.delegate?.topViewClickBackButton()
        }
    }

    private func setupForumTopView() {
        
        let topView:UIView = UIView.init()
        topView.backgroundColor = LDXBaseNav
        self.addSubview(topView)
        
        topView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.size.equalTo(CGSize(width:SCREEN_WIDTH,height:SCREEN_STATUS_BAR_HEIGHT+44))
        }
        
        let searchInput:UITextField = UITextField.init()
        searchInput.font = UIFont.lf_systemFont(ofSize: 14)
        searchInput.placeholder = "请输入关键词搜索"
        searchInput.backgroundColor = RGBAColor(r: 230, g: 230, b: 230, a: 0.7)
        searchInput.layer.cornerRadius = UIView.lf_size(fromIphone6: 5)
        searchInput.layer.masksToBounds = true
        let leftView:UIView = UIView.init(frame:  CGRect(x: 0, y: 0,width:UIView.lf_size(fromIphone6: 36),height:UIView.lf_size(fromIphone6: 28)))
        searchInput.leftView = leftView
        searchInput.leftViewMode = UITextFieldViewMode.always
        let searchImage:UIImageView = UIImageView.init(image:UIImage.init(named: "home_nav_2_search"))
        searchImage.frame = CGRect(x:UIView.lf_size(fromIphone6: 10),y:UIView.lf_size(fromIphone6: 5),width:UIView.lf_size(fromIphone6: 15),height:UIView.lf_size(fromIphone6: 15))
        leftView.addSubview(searchImage)
        topView.addSubview(searchInput)
        
        searchInput.snp.makeConstraints { (make) in
            make.top.equalTo(topView).offset(8+SCREEN_STATUS_BAR_HEIGHT)
            make.left.equalTo(topView).offset(UIView.lf_size(fromIphone6: 35))
            make.size.equalTo(CGSize(width:UIView.lf_size(fromIphone6: 257),height:UIView.lf_size(fromIphone6: 28)))
        }
        
        let backButton:UIButton = UIButton.init()
        backButton.setImage(UIImage.init(named: "nav_2_1_back"), for: .normal)
        backButton.addTarget(self, action:#selector(self.handleClickBackButton) , for: .touchUpInside)
        topView.addSubview(backButton)
        
        backButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(searchInput)
            make.left.equalTo(topView).offset(UIView.lf_size(fromIphone6: 13))
        }

        let nearButton:UIButton = UIButton.init()
        nearButton.setTitle("附近小区", for: .normal)
        nearButton.titleLabel?.font = UIFont.lf_systemFont(ofSize: 15)
        nearButton.setTitleColor(RGBColor(r: 51, g: 51, b: 51), for: .normal)
        topView.addSubview(nearButton)
        
        nearButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(searchInput)
            make.right.equalTo(topView).offset(UIView.lf_size(fromIphone6: -13))
        }
        
        let typeArray:[String] = ["推荐","闲聊","买卖","晒妹子"]
        var count = typeArray.count
        count -= 1
        while count >= 0 {
            let button:UIButton = UIButton.init()
            button.setTitle(typeArray[count], for: .normal)
            button.setTitleColor(RGBColor(r: 236, g: 189, b: 80), for: .selected)
            button.titleLabel?.font = UIFont.lf_systemFont(ofSize: 16)
            button.setTitleColor(RGBColor(r: 101, g: 101, b: 101), for: .normal)
            self.addSubview(button)
            button.addTarget(self, action: #selector(handleClickTypeButton(button:)), for: .touchUpInside)
            let width:CGFloat = (SCREEN_WIDTH/CGFloat(typeArray.count))
            button.snp.makeConstraints({ (make) in
                make.top.equalTo(topView.snp.bottom)
                make.left.equalTo(self).offset((width*CGFloat(count)))
                make.size.equalTo(CGSize(width:width,height:UIView.lf_size(fromIphone6: 44)))
            })
            
            if count == 0 {
                button.isSelected = true
                self.selectButton = button
                let line:UIView = UIView.init()
                self.line = line
                line.backgroundColor = RGBColor(r: 236, g:189 , b: 80)
                self.addSubview(line)
                
                line.snp.makeConstraints({ (make) in
                    make.centerX.equalTo(button)
                    make.bottom.equalTo(button)
                    make.size.equalTo(CGSize(width:UIView.lf_size(fromIphone6: 40),height:UIView.lf_size(fromIphone6: 2)))
                })
            }
            count -= 1
        }
        let line:UIView = UIView.init()
        line.backgroundColor = RGBColor(r: 221, g: 221, b: 221)
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.bottom.left.equalTo(self)
            make.size.equalTo(CGSize(width:SCREEN_WIDTH,height:UIView.lf_size(fromIphone6: 1)))
        }
    }
    
    @objc func handleClickTypeButton(button:UIButton)  {
        if self.selectButton != button {
            button.isSelected = true
            self.selectButton.isSelected = false
            self.selectButton = button
            
            self.line.snp.remakeConstraints({ (make) in
                make.centerX.equalTo(button)
                make.bottom.equalTo(button)
                make.size.equalTo(CGSize(width:UIView.lf_size(fromIphone6: 40),height:UIView.lf_size(fromIphone6: 2)))
            })
        }
    }
}
