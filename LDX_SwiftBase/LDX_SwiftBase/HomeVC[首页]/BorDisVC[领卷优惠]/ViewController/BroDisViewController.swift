//
//  BroDisViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/1/27.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit
import HMSegmentedControl
class BroDisViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let CellId:String = "cellid"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "领卷优惠"
        self.view.backgroundColor = LDX245BackColor
        headTextView.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 45)
        self.view.addSubview(headTextView)
        
        self.view.addSubview(BordisTabView)
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = BorDisTableViewCell()
        
        cell = self.BordisTabView.dequeueReusableCell(withIdentifier: CellId, for: indexPath) as! BorDisTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    //MARK: ==========创建TabView=========
    lazy var BordisTabView : UITableView = {
        let tabView = UITableView.init(frame: CGRect(x:0, y:64+45, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64-45), style: .plain)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.backgroundColor = .clear
        tabView.separatorStyle = UITableViewCellSeparatorStyle.none
        tabView.register(UINib.init(nibName: "BorDisTableViewCell", bundle: nil), forCellReuseIdentifier: CellId)
        return tabView
    }()
    
    //头部视图
    fileprivate lazy var headTextView: HeadTextView = {
        let nibView = Bundle.main.loadNibNamed("HeadTextView", owner: nil, options: nil)?.first
        
        return nibView as! HeadTextView
    }()
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    
    
    
    
    
    
    //三方设置选择
    func CreatSegment(){
        let hmsegment = HMSegmentedControl.init(sectionTitles: ["默认","时间","面值"])
        hmsegment?.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 45)
        hmsegment?.autoresizingMask = [.flexibleTopMargin]
        hmsegment?.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.gray]
        hmsegment?.selectedTitleTextAttributes = [NSAttributedStringKey.foregroundColor:LDXBaseNav]
        hmsegment?.selectionStyle = HMSegmentedControlSelectionStyle.textWidthStripe
        hmsegment?.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.down
        hmsegment?.selectionIndicatorColor = .red
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
