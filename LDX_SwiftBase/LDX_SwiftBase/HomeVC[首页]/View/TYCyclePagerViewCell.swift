//
//  TYCyclePagerViewCell.swift
//  TYCyclePagerViewDemo_swift
//
//  Created by tany on 2017/7/20.
//  Copyright © 2017年 tany. All rights reserved.
//

import UIKit
import Kingfisher
class TYCyclePagerViewCell: UICollectionViewCell {
    
    lazy var ImageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addUImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.addUImageView()
    }
    

    func addUImageView() {
        self.ImageView.center = self.center
        self.addSubview(self.ImageView)
    }
    /**
     
     *配置Cell的内容方法
     
     */
    
    func configCellWithStatusModel(model:HomeModel!)
    {
        self.ImageView.kf.setImage(with: URL(string: model.image!))
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.ImageView.frame = self.bounds
    }
}
