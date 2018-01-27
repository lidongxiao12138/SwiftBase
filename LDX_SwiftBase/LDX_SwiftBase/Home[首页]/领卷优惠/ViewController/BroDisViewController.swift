//
//  BroDisViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/1/27.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit
import HMSegmentedControl
class BroDisViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let hmsegment = HMSegmentedControl.init(sectionTitles: ["默认","时间","面值"])
        hmsegment?.frame = CGRect(x: 0, y: 200, width: SCREEN_WIDTH, height: 45)
        hmsegment?.selectionIndicatorHeight = 3.0
        hmsegment?.titleTextAttributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14)]
        hmsegment?.selectedTitleTextAttributes = [text]
        hmsegment?.backgroundColor = .green
        self.view.addSubview(hmsegment!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
