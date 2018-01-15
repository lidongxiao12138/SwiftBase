//
//  HomeHeadView.swift
//  LDX_SwiftBase
//
//  Created by mac on 2018/1/3.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class HomeHeadView: UICollectionReusableView {
    @IBOutlet weak var ViewImageRoll: UIView!
    
    @IBOutlet weak var viewLabRoll: UIView!
    
    static func homeView() -> HomeHeadView? {
        let nibView = Bundle.main.loadNibNamed("HomeHeadView", owner: nil, options: nil)
        if let view = nibView?.first as? HomeHeadView {
            
            
            return view
        }
        return nil
    
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
