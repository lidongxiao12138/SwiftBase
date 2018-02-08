//
//  LDXForumCommentContentView.swift
//  LDX_SwiftBase
//
//  Created by cherry pu on 2018/2/8.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class LDXForumCommentContentView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpCommentView()
    }
    
    private var bgImageView:UIImageView = UIImageView.init()
    private let baseTag:NSInteger = 100

    func setUpCommentView()  {
        
        self.snp.makeConstraints { (make) in
            make.height.equalTo(0)
            make.width.lessThanOrEqualTo(SCREEN_WIDTH)
        }

        
        let titleLabel:UILabel = UILabel.init()
        titleLabel.text = "评论"
        titleLabel.font = UIFont.lf_systemFont(ofSize: 12)
        titleLabel.textColor = RGBColor(r: 152, g: 152, b: 152)
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(UIView.lf_size(fromIphone6: 12))
            make.left.equalTo(self).offset(UIView.lf_size(fromIphone6: 75))
        }
        
        let bgImageView:UIImageView = UIImageView.init()
        bgImageView.isUserInteractionEnabled = true
        bgImageView.image = UIImage.init(named: "comment_bj")
        self.bgImageView = bgImageView
        self.addSubview(bgImageView)
        
        bgImageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(UIView.lf_size(fromIphone6: 5))
            make.left.equalTo(titleLabel)
            make.right.equalTo(self).offset(UIView.lf_size(fromIphone6: -13))
            make.bottom.equalTo(self).offset(UIView.lf_size(fromIphone6: -15))
        }
    }
    
    var _commentArray:NSArray = []
    private var lastCommentLabel:UILabel = UILabel.init()
    
    public var commentArray:NSArray {
        get {
            return _commentArray
        }
        
        set {
            _commentArray = newValue
            
            for view in self.subviews {
                if view.tag > baseTag {
                    view.removeFromSuperview()
                }
            }
            
            var i = 0
            var commentHeight:CGFloat = 0.0
            while i < commentArray.count {
                let commentLabel:UILabel = UILabel.init()
                commentLabel.tag = (baseTag + i)
                let attStr:NSMutableAttributedString = NSMutableAttributedString.init(string: commentArray[i] as! String, attributes: [NSAttributedStringKey.foregroundColor:RGBColor(r: 101, g: 101, b: 101),NSAttributedStringKey.font:UIFont.lf_systemFont(ofSize: 12)])
                attStr.addAttributes([NSAttributedStringKey.foregroundColor:RGBColor(r: 236, g: 189, b: 80)], range: NSMakeRange(0, 4))
                commentLabel.attributedText = attStr
                commentLabel.numberOfLines = 0
                self.bgImageView.addSubview(commentLabel)
                
                commentLabel.snp.makeConstraints({ (make) in
                    make.left.equalTo(self.bgImageView).offset(UIView.lf_size(fromIphone6: 10))
                    make.right.equalTo(self.bgImageView).offset(UIView.lf_size(fromIphone6: -10))
                    if i == 0 {
                        make.top.equalTo(self.bgImageView).offset(UIView.lf_size(fromIphone6: 15))
                    }else {
                        make.top.equalTo(self.lastCommentLabel.snp.bottom).offset(UIView.lf_size(fromIphone6: 10))
                    }
                    self.lastCommentLabel = commentLabel
                })
                let string:NSString = commentArray[i] as! NSString
                commentHeight += (string.boundingRect(with: CGSize(width:SCREEN_WIDTH-UIView.lf_size(fromIphone6: 107),height:999), options:.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:UIFont.lf_systemFont(ofSize: 12)], context: nil)).size.height
                commentHeight += UIView.lf_size(fromIphone6: 10)
                i += 1
            }
            
            if commentArray.count == 0 {
                self.snp.updateConstraints({ (make) in
                    make.height.equalTo(15)
                })
            }else {
//                计算文字高度
                self.snp.updateConstraints({ (make) in
                    make.height.equalTo(UIView.lf_size(fromIphone6: 48)+UIView.lf_size(fromIphone6: 20)+commentHeight)
                })
            }
        }
    }
}
