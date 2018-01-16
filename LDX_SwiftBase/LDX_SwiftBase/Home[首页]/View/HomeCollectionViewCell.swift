//
//  HomeCollectionViewCell.swift
//  LDX_SwiftBase
//
//  Created by mac on 2018/1/10.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ImageTitleView: UIImageView!//头部照片
    
    @IBOutlet weak var LabNameMer: UILabel!//商品名字
    
    @IBOutlet weak var LabMoney: UILabel!//商品价格
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       Ridus(Rview: ImageTitleView, Ridus: 3)
        // Initialization code
    }

}
