//
//  SearchItemsViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/5.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class SearchItemsViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //加载头部视图
        navCenter.frame = CGRect(x: 40*d_width, y: 7, width: 280*d_width, height: 29);
        navCenter.center.x = (self.navigationController?.navigationBar.center.x)!
        self.navigationController?.navigationBar.addSubview(self.navCenter)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navCenter.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let LabArray = ["中国","超火的女装外套","小棉服女短款","iPhone x","热水袋 注水","义乌特产","羊毛衫女2017新款"];
        let messLable = MSSAutoresizeLabelFlow.init(frame: CGRect(x:0, y:64 + 55, width:SCREEN_WIDTH, height:SCREEN_HEIGHT-64), titles: LabArray) { ( index, title) in
            print(index,title ?? "")
        }
    
        searchview.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 55)
        self.view.addSubview(searchview)
        self.view.addSubview(messLable!)
        
        CreatNavRight()
        // Do any additional setup after loading the view.
    }
    func CreatNavRight(){
        let but = UIButton.init(type: .custom)
        but.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        but.setTitle("搜索", for: .normal)
        but.addTarget(self, action: #selector(NavClick), for: .touchUpInside)
        but.setTitleColor(.black, for: .normal)
        but.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        but.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        but.sizeToFit()
        let bar = UIBarButtonItem.init(customView: but)
        navigationItem.rightBarButtonItem = bar
    }
    //按钮事件
    @objc func NavClick(){
        print("搜索按钮")
    }
    fileprivate lazy var searchview: SearchListView = {
        let nibView = Bundle.main.loadNibNamed("SearchListView", owner: nil, options: nil)?.first
        return nibView as! SearchListView
    }()
    
    //nav按钮
    fileprivate lazy var navCenter: SearchTextView = {
        let nibView = Bundle.main.loadNibNamed("SearchTextView", owner: nil, options: nil)?.first
        
        return nibView as! SearchTextView
    }()
    
//    //搜索
//    fileprivate lazy var navCenter: SearchListView = {
//        let nibView = Bundle.main.loadNibNamed("NavCenterView", owner: nil, options: nil)?.first
//
//        return nibView as! NavCenterView
//    }()
    
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
