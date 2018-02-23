//
//  MeHeadView.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/1/26.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class MeHeadView: UBaseCollectionReusableView {

    @IBOutlet weak var ButReturn: UIButton!
    
    @IBAction func ButReturnClick(_ sender: UIButton) {
        let returnView = ReturnMerViewController()
        self.viewController()?.navigationController?.pushViewController(returnView, animated: true)
        
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        // Drawing code
    }
 

}
