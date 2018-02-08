//
//  LDXForumTableViewCell.swift
//  LDX_SwiftBase
//
//  Created by cherry pu on 2018/2/7.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class LDXForumTableViewCell: UITableViewCell {

    private var noImageConstraint :AnyObject? = nil
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let contantView:UIView = UIView.init()
        self.contentView.addSubview(contantView)
        
        contantView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            make.width.lessThanOrEqualTo(SCREEN_WIDTH)
        }
        
        let header:UIImageView = UIImageView.init()
        header.image = UIImage.init(named: "Pay_xuanze_pre")
        contantView.addSubview(header)
        
        header.snp.makeConstraints { (make) in
            make.top.left.equalTo(contantView).offset(UIView.lf_size(fromIphone6: 12))
            make.width.height.equalTo(UIView.lf_size(fromIphone6: 50))
        }
        
        let nameLabel:UILabel = UILabel.init()
        nameLabel.text = "皮卡丘"
        nameLabel.textColor = RGBColor(r: 40, g: 40, b: 40)
        nameLabel.font = UIFont.lf_systemFont(ofSize: 14)
        contantView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(header).offset(UIView.lf_size(fromIphone6: 5))
            make.left.equalTo(header.snp.right).offset(UIView.lf_size(fromIphone6: 10))
        }
        
        let messageLabel:UILabel = UILabel.init()
        messageLabel.text = "家里闲置了一台电脑，i7+gt+1070+16G，便宜卖，电话或微信：15145788648"
        messageLabel.textColor = RGBColor(r: 101, g: 101, b: 101)
        messageLabel.font = UIFont.lf_systemFont(ofSize: 12)
        messageLabel.numberOfLines = 0
        contantView.addSubview(messageLabel)
        
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(UIView.lf_size(fromIphone6: 16))
            make.left.equalTo(nameLabel)
            make.width.equalTo(UIView.lf_size(fromIphone6: 275))
        }
        
        let timeLabel:UILabel = UILabel.init()
        timeLabel.text = "26分钟前"
        timeLabel.textColor = RGBColor(r: 152, g: 152, b: 152)
        timeLabel.font = UIFont.lf_systemFont(ofSize: 12)
        contantView.addSubview(timeLabel)
        
        timeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameLabel);
            make.right.equalTo(contantView).offset(UIView.lf_size(fromIphone6: -13))
        }
        
        let typeButton:UIButton = UIButton.init()
        typeButton.setTitle("闲聊", for: .normal)
        typeButton.setTitleColor(RGBColor(r: 236, g: 189, b: 80), for: .normal)
        typeButton.titleLabel?.font = UIFont.lf_systemFont(ofSize: 11)
         typeButton.setBackgroundImage(UIImage.init(named: "RoundAngle"), for: .normal)
        typeButton.backgroundColor = RGBColor(r: 255, g: 255, b: 255)
        contantView.addSubview(typeButton)
        
        typeButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameLabel)
            make.left.equalTo(nameLabel.snp.right).offset(UIView.lf_size(fromIphone6: 12))
            make.size.equalTo(CGSize(width:typeButton.intrinsicContentSize.width+UIView.lf_size(fromIphone6: 10),height:UIView.lf_size(fromIphone6: 18)))
        }
        
        let imageContentView:LDXForumImageContentView = LDXForumImageContentView.init(frame:CGRect(x:0,y:0,width:0,height:0))
        imageContentView.imagePathArray = ["123","123","123"]
        contantView.addSubview(imageContentView)
        
        imageContentView.snp.makeConstraints { (make) in
            self.noImageConstraint = make.top.equalTo(messageLabel.snp.bottom).offset(UIView.lf_size(fromIphone6: 10))
            make.left.equalTo(contantView).offset(UIView.lf_size(fromIphone6: 74))
            make.top.equalTo(messageLabel.snp.bottom).priority(.low)
        }
        
        let commentButton:UIButton = UIButton.init()
        commentButton.setTitle("0", for: .normal)
        commentButton.setTitleColor(RGBColor(r: 152, g: 152, b: 152), for: .normal)
        commentButton.titleLabel?.font = UIFont.lf_systemFont(ofSize: 12)
        commentButton.setImage(UIImage.init(named: "pinglun"), for: .normal)
        commentButton.titleEdgeInsets = UIEdgeInsetsMake(0, UIView.lf_size(fromIphone6: 5), 0, 0)
        contantView.addSubview(commentButton)
        
        commentButton.snp.makeConstraints { (make) in
            make.top.equalTo(imageContentView.snp.bottom).offset(UIView.lf_size(fromIphone6: 10))
            make.right.equalTo(contantView).offset(UIView.lf_size(fromIphone6: -13))
            make.width.equalTo(commentButton.intrinsicContentSize.width+UIView.lf_size(fromIphone6: 5))
        }
        
        let zanButton:UIButton = UIButton.init()
        zanButton.setTitle("112", for: .normal)
        zanButton.setTitleColor(RGBColor(r: 152, g: 152, b: 152), for: .normal)
        zanButton.titleLabel?.font = UIFont.lf_systemFont(ofSize: 12)
        zanButton.setImage(UIImage.init(named: "dianzan"), for: .normal)
        zanButton.titleEdgeInsets = UIEdgeInsetsMake(0, UIView.lf_size(fromIphone6: 5), 0, 0)
        contantView.addSubview(zanButton)
        
        zanButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(commentButton)
            make.right.equalTo(commentButton.snp.left).offset(UIView.lf_size(fromIphone6: -10))
            make.width.equalTo(commentButton.intrinsicContentSize.width+UIView.lf_size(fromIphone6: 5))
        }
        
        let commentView:LDXForumCommentContentView = LDXForumCommentContentView.init(frame: CGRect(x:0,y:0,width:0,height:0))
        commentView.commentArray = ["一叶子：怎么卖啊？","倦鸟余：能不能发个图片看看啊？","倦鸟余：便宜点不"]
        contantView.addSubview(commentView)
        
        commentView.snp.makeConstraints { (make) in
            make.top.equalTo(zanButton.snp.bottom)
            make.left.right.equalTo(contantView)
            make.bottom.equalTo(contantView).priority(.high)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
