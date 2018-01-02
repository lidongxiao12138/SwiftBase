//
//  HomeTableViewCell.swift
//  LDX_SwiftBase
//
//  Created by mac on 2017/12/25.
//  Copyright © 2017年 LDX. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var Lab1: UILabel!
    @IBOutlet weak var Lab2: UILabel!
    @IBOutlet weak var Lab3: UILabel!
    @IBOutlet weak var LabTitleName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //设置圆角
        CreatViewRadius()
        

        
        
        
        
        
        
        // Initialization code
    }
    
    func CreatViewRadius(){
        ViewRaidusBorWidth(View: self.Lab1, Radius: 7, BorWidth: 1, Color: RLDXBaseNav)
        ViewRaidusBorWidth(View: self.Lab2, Radius: 7, BorWidth: 1, Color: RLDXBaseNav)
        ViewRaidusBorWidth(View: self.Lab3, Radius: 7, BorWidth: 1, Color: RLDXBaseNav)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /**
     
     *配置Cell的内容方法
     
     */
    
    func configCellWithStatusModel(model:HomeModel!)
    {
        self.LabTitleName.text = model.car_number
    }
    
}




func ViewRaidus(View:UIView , Radius:CGFloat){
    View.layer.cornerRadius = Radius
}

func ViewRaidusBorWidth(View:UIView ,Radius:CGFloat ,BorWidth:CGFloat ,Color:CGColor){
    View.layer.cornerRadius = Radius
    View.layer.borderWidth = BorWidth
    View.layer.borderColor = Color
}
