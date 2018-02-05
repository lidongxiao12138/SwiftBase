//
//  SortingTableViewCell.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/1/31.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class SortingTableViewCell: UITableViewCell {

    @IBOutlet weak var LabName: UILabel!//列表名
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ViewRaidus(View: self.LabName, Radius: 14.5)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
