//
//  ShoppingTableViewCell.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/5.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet weak var ButImageShooping: UIButton!//商品
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ViewRaidus(View: ButImageShooping, Radius: 5)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
