//
//  TabBarSecViewController.swift
//  LDX_SwiftBase
//
//  Created by mac on 2017/12/22.
//  Copyright © 2017年 LDX. All rights reserved.
//

import UIKit

class TabBarSecViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,LDXForumTopViewDelegate {

    private let FORUM_TABLE_CELL:String = "FORUM_TABLE_CELL"
    private var sendCommentView:LDXSendCommentView = LDXSendCommentView.init(frame: CGRect(x:0,y:0,width:0,height:0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavi()
        self.setUpForumView()
    }
    
    deinit {
        /// 移除通知
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setUpNavi()  {
        NotificationCenter.default.addObserver(self, selector:#selector(handleKeyBoardWillShow(notification:)) , name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(handleKeyBoardWillHidden(notification:)) , name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        self.view.backgroundColor = UIColor.white
    }
    
    @objc func handleKeyBoardWillShow(notification:Notification) {
        self.sendCommentView.snp.remakeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-UIView.lf_size(fromIphone6: 44))
            make.left.equalTo(self.view)
            make.size.equalTo(CGSize(width:SCREEN_WIDTH,height:UIView.lf_size(fromIphone6: 44)))
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func handleKeyBoardWillHidden(notification:Notification) {
        self.sendCommentView.snp.remakeConstraints { (make) in
            make.top.equalTo(self.view.snp.bottom)
            make.left.equalTo(self.view)
            make.size.equalTo(CGSize(width:SCREEN_WIDTH,height:UIView.lf_size(fromIphone6: 44)))
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
//    LDXForumTopViewDelegate
    func topViewClickBackButton() {
        self.tabBarController?.selectedIndex  = 0
    }
    
    @objc func handleClickSendButton() {
        let myForumVC:LDXMyForumViewController = LDXMyForumViewController()
        self.navigationController?.pushViewController(myForumVC, animated: true)
    }

    
    func setUpForumView() {
        let topView:LDXForumTopView = LDXForumTopView.init(frame: CGRect(x:0,y:0,width:SCREEN_WIDTH,height:SCREEN_STATUS_BAR_HEIGHT+44+UIView.lf_size(fromIphone6: 44)))
        topView.delegate = self
        self.view.addSubview(topView)
        
        let myForumButton:UIButton = UIButton.init()
        myForumButton.setTitle("我的帖子", for: .normal)
        myForumButton.addTarget(self, action: #selector(handleClickSendButton), for: .touchUpInside)
        myForumButton.setTitleColor(RGBColor(r: 236, g: 189, b: 80), for: .normal)
        myForumButton.backgroundColor = RGBColor(r: 68, g: 68, b: 68)
        myForumButton.titleLabel?.font = UIFont.lf_systemFont(ofSize: 16)
        self.view.addSubview(myForumButton)
        
        myForumButton.snp.makeConstraints { (make) in
            make.bottom.left.equalTo(self.view)
            make.size.equalTo(CGSize(width:SCREEN_WIDTH,height:UIView.lf_size(fromIphone6: 49)))
        }
        
        let table:UITableView = UITableView.init(frame: CGRect(x:0,y:0,width:0,height:0), style: UITableViewStyle.grouped)
        table.delegate = self
        table.dataSource = self
        table.register(LDXForumTableViewCell.self, forCellReuseIdentifier: FORUM_TABLE_CELL)
        table.separatorStyle = .none
        self.view.addSubview(table)

        table.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(SCREEN_STATUS_BAR_HEIGHT+44+UIView.lf_size(fromIphone6: 44))
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(myForumButton.snp.top)
        }
        
        let sendCommentView:LDXSendCommentView = LDXSendCommentView.init(frame: CGRect(x:0,y:SCREEN_HEIGHT,width:0,height:0))
        self.sendCommentView = sendCommentView
        self.view.addSubview(sendCommentView)
        
        sendCommentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.bottom)
            make.left.equalTo(self.view)
            make.size.equalTo(CGSize(width:SCREEN_WIDTH,height:UIView.lf_size(fromIphone6: 44)))
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:LDXForumTableViewCell = tableView.dequeueReusableCell(withIdentifier: FORUM_TABLE_CELL, for: indexPath) as! LDXForumTableViewCell
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.fd_heightForCell(withIdentifier: FORUM_TABLE_CELL, cacheBy: indexPath) { (cell) in
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.sendCommentView.sendTextField.becomeFirstResponder()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.view.endEditing(true)
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UIView.lf_size(fromIphone6: 10)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
}
