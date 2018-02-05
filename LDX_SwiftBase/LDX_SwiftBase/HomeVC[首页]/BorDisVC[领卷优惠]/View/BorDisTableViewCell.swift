//
//  BorDisTableViewCell.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/1/29.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class BorDisTableViewCell: UITableViewCell {
    @IBOutlet weak var ViewBall: UIView!//扇形View
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        pieChart()
        // Initialization code
    }
    func pieChart()  {
        let item1 = ShinePieItem.init(color: LDXBaseNav, value: 0.1,title: "")
        let item3 = ShinePieItem.init(color: LDXQianYellowkColor, value: 0.3,title: "")
        let pie = ShinePieChart.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50), items: [item1,item3])
        pie.ringRadius = 20
        pie.startAngle = 0.2
        pie.font = UIFont.systemFont(ofSize: 0)
        pie.showDescription = false
        pie.duration = 3
        let lab = UILabel()
        lab.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        lab.text = "已抢10%"
        lab.textAlignment = NSTextAlignment.center
        lab.center.x = pie.center.x
        lab.center.y = pie.center.y
        lab.numberOfLines = 0
        lab.textColor = LDXBaseNav
        lab.font = UIFont.systemFont(ofSize: 10)
        pie.addSubview(lab)
        ViewBall.addSubview(pie)
    }
    deinit {
        print("deinit")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
