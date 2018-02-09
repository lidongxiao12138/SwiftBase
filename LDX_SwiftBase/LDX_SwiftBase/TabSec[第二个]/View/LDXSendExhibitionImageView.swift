//
//  LDXSendExhibitionImageView.swift
//  LDX_SwiftBase
//
//  Created by cherry pu on 2018/2/9.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

protocol LDXSendExhibitionImageViewDelegate:NSObjectProtocol
{
    func sendExhibitionImageViewClickDeleteButton(imageView:LDXSendExhibitionImageView)
}


class LDXSendExhibitionImageView: UIView {

    weak open var delegate: LDXSendExhibitionImageViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(image:UIImage, frame: CGRect) {
        self.init(frame: frame)
        
        let imageWidth = (SCREEN_WIDTH - UIView.lf_size(fromIphone6: 56))/4
        
        let imageButton:UIButton = UIButton.init()
        imageButton.addTarget(self, action: #selector(handleClickImageButton), for: .touchUpInside)
        imageButton.imageView?.contentMode = .scaleAspectFill
        imageButton.setImage(image, for: .normal)
        self.addSubview(imageButton)
        
        imageButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width:imageWidth,height:imageWidth))
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        let deleteButton:UIButton = UIButton.init()
        deleteButton.setImage(UIImage.init(named: "icon_delete"), for: .normal)
        deleteButton.addTarget(self, action: #selector(handleClickDeleteButton), for:  .touchUpInside)
        self.addSubview(deleteButton)
        
        deleteButton.snp.makeConstraints { (make) in
            make.right.equalTo(self)
            make.top.equalTo(self).offset(UIView.lf_size(fromIphone6: -5))
        }
    }
    
    @objc func handleClickImageButton()
    {
        
    }
    
    @objc func handleClickDeleteButton()
    {
        if self.delegate != nil {
            self.delegate?.sendExhibitionImageViewClickDeleteButton(imageView: self)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
