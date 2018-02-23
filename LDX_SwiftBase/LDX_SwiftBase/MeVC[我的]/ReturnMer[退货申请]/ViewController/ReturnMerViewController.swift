//
//  ReturnMerViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/2/6.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class ReturnMerViewController: UIViewController {
    //MAEK:=========== 进入程序 ==============
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "退货申请"
        self.view.backgroundColor = .white
        returnheadView.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        returnheadView.butReturnWhy.addTarget(self, action: #selector(butReturnClick), for: .touchUpInside)
        self.view.addSubview(returnheadView)
        

        
        self.view.addSubview(butSureView)
        // Do any additional setup after loading the view.
    }
    @objc func butReturnClick() {
        returnWhyView.frame = self.view.frame
        self.view.addSubview(returnWhyView)
    }
    
    //MARK:=========== 加载视图 ==============
    //基本视图
    lazy var returnheadView:ReturnHeadView = {
        let nibView = Bundle.main.loadNibNamed("ReturnHeadView", owner: nil, options: nil)?.last
        return nibView as! ReturnHeadView
    }()
    //退货原因
    lazy var returnWhyView:ReturnWhyView = {
        let nibView = Bundle.main.loadNibNamed("ReturnWhyView", owner: nil, options: nil)?.last
        return nibView as! ReturnWhyView
    }()
    //提交申请
    lazy var butSureView:ButSureView = {
        var butSure = ButSureView()
        butSure = Bundle.main.loadNibNamed("ButSureView", owner: nil, options: nil)?.last as! ButSureView
        //提交申请
        butSure.frame = CGRect(x: 0, y: SCREEN_HEIGHT-50, width:SCREEN_WIDTH, height: 50)
        //按钮
        butSure.ButSure.addTarget(self, action: #selector(butSureClick), for: .touchUpInside)
        return butSure
    }()
    
    @objc func butSureClick(){
        print("确定")
        let AfterList = AfterListViewController()
        navigationController?.pushViewController(AfterList, animated: true)
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
