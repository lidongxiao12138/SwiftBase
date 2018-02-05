//
//  HomeTableViewCell.swift
//  LDX_SwiftBase
//
//  Created by mac on 2017/12/25.
//  Copyright © 2017年 LDX. All rights reserved.
//

import UIKit
import SwiftyJSON
class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var Lab1: UILabel!
    @IBOutlet weak var Lab2: UILabel!
    @IBOutlet weak var Lab3: UILabel!
    @IBOutlet weak var LabTitleName: UILabel!
    @IBOutlet weak var LabAddress: UILabel!//地址
    @IBOutlet weak var LabPeople: UILabel!//报名人数
    @IBOutlet weak var LabMoney: UILabel!//钱数
    
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
        self.LabTitleName.text = model.title
        self.LabAddress.text = "\(model.province ?? "")\(model.city ?? "")"
        self.LabPeople.text = "\(model.enroll_count ?? "")人报名"
        self.LabMoney.text = "\(model.money_min ?? "")~\(model.money_max ?? "")"
        //MAEK:=========== 设置福利框 ==============
        
        print(model.welfares?.count as Any)

        if ((model.welfares?.count) != nil) {
            if model.welfares?.count == 1
            {
                self.Lab1.text = JSON.init(model.welfares![0]).string
                self.Lab2.isHidden = true
                self.Lab3.isHidden = true
            }
            if model.welfares?.count == 2{
                self.Lab1.text = JSON.init(model.welfares![0]).string
                self.Lab2.text = JSON.init(model.welfares![1]).string
                self.Lab3.isHidden = true
            }
            if model.welfares?.count == 3{
                self.Lab1.text = JSON.init(model.welfares![0]).string
                self.Lab2.text = JSON.init(model.welfares![1]).string
                self.Lab3.text = JSON.init(model.welfares![2]).string
            }
            if model.welfares?.count == 4{
                self.Lab1.text = JSON.init(model.welfares![0]).string
                self.Lab2.text = JSON.init(model.welfares![1]).string
                self.Lab3.text = JSON.init(model.welfares![2]).string
            }
            if model.welfares?.count == 5{
                self.Lab1.text = JSON.init(model.welfares![0]).string
                self.Lab2.text = JSON.init(model.welfares![1]).string
                self.Lab3.text = JSON.init(model.welfares![2]).string
            }
        }
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
