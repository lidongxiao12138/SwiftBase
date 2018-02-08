//
//  LDXForumImageContentView.swift
//  LDX_SwiftBase
//
//  Created by cherry pu on 2018/2/7.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class LDXForumImageContentView: UIView {

    private var imageArray:NSMutableArray = NSMutableArray.init()
    private let imageWidth:CGFloat = (SCREEN_WIDTH-UIView.lf_size(fromIphone6: 108))/3
    private let defaultImage:UIImage = UIImage.createImage(with: RGBColor(r: 242, g: 242, b: 242))
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
    }

    func setUpView() {
        var i = 0
        
        self.snp.makeConstraints { (make) in
            make.height.equalTo((self.imageWidth+UIView.lf_size(fromIphone6: 10))*3)
            make.width.equalTo(SCREEN_WIDTH-UIView.lf_size(fromIphone6: 88))
        }

        while i < 9 {
            let imageView:UIImageView = UIImageView.init()
            imageView.contentMode = UIViewContentMode.scaleAspectFill
            imageView.layer.masksToBounds = true
            imageView.image = self.defaultImage
            imageView.tag = i
            imageView.isUserInteractionEnabled = true
//            imageView.isHidden = true
            self.imageArray.add(imageView)
            self.addSubview(imageView)
            
            imageView.snp.makeConstraints({ (make) in
                make.top.equalTo(self).offset((self.imageWidth+UIView.lf_size(fromIphone6: 10))*CGFloat(i/3))
                make.left.equalTo(self).offset((self.imageWidth+UIView.lf_size(fromIphone6: 10))*CGFloat(i%3))
                make.size.equalTo(CGSize(width:self.imageWidth,height:self.imageWidth))
            })
            
            i += 1
        }
    }
    
    var _imagePathArray: NSArray = []
    
    public var imagePathArray:NSArray {
        get {
            return _imagePathArray
        }
        set {
           _imagePathArray = newValue

            for view in self.subviews {
                view.isHidden = true
            }

            if imagePathArray.count == 0 {
                self.snp.updateConstraints({ (make) in
                    make.height.equalTo(0)
                })
            }else {
                var line = 0
                line = imagePathArray.count/3
                if imagePathArray.count%3 != 0 {
                    line += 1
                }
                self.snp.updateConstraints({ (make) in
                    make.height.equalTo(CGFloat(line)*(self.imageWidth+UIView.lf_size(fromIphone6:10)))
                })
            }

            var i = 0
            while i < imagePathArray.count {
                let imageView:UIImageView = self.imageArray[i] as! UIImageView
                imageView.isHidden = false
                i += 1
            }
        }
    
    }

    
}
