//
//  LDXSendForumSearchView.swift
//  LDX_SwiftBase
//
//  Created by cherry pu on 2018/2/9.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

protocol LDXSendForumSearchViewDelegate:NSObjectProtocol
{
    func sendForumBeginEdit()
}


class LDXSendForumSearchView: UIView,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    weak open var delegate: LDXSendForumSearchViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private let SEARCH_RESULT_CELL = "SEARCH_RESULT_CELL"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpSearchView()
    }
    
    func setUpSearchView() {
        let topTextField:UITextField = UITextField.init()
        topTextField.delegate = self
        let leftView:UIView = UIView.init(frame: CGRect(x:0,y:0,width:UIView.lf_size(fromIphone6: 42),height:UIView.lf_size(fromIphone6: 40)))
        let leftImageView:UIImageView = UIImageView.init()
        let leftImage = UIImage.init(named: "icon_8_4_xiaoqu")
        leftImageView.frame = CGRect(x:UIView.lf_size(fromIphone6: 12),y:UIView.lf_size(fromIphone6: 10),width:(leftImage?.size.width)!,height:(leftImage?.size.height)!)
        leftImageView.image = leftImage
        leftView.addSubview(leftImageView)
        topTextField.leftView = leftView
        topTextField.leftViewMode = .always
        topTextField.clearButtonMode = .whileEditing
        topTextField.backgroundColor = RGBColor(r: 242, g: 242, b: 242)
        self.addSubview(topTextField)
        
        topTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self).offset(UIView.lf_size(fromIphone6: 12))
            make.right.equalTo(self).offset(UIView.lf_size(fromIphone6: -12))
            make.height.equalTo(UIView.lf_size(fromIphone6: 40))
        }
        
        let tableView:UITableView = UITableView.init(frame: CGRect(x:0,y:0,width:0,height:0), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: SEARCH_RESULT_CELL)
        tableView.layer.borderColor = RGBColor(r: 221, g: 221, b: 221).cgColor
        tableView.layer.borderWidth = UIView.lf_size(fromIphone6: 1)
        tableView.layer.masksToBounds = true
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(topTextField.snp.bottom)
            make.left.right.equalTo(topTextField)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if self.delegate != nil
        {
            self.delegate?.sendForumBeginEdit()
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIView.lf_size(fromIphone6: 30)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: SEARCH_RESULT_CELL, for: indexPath)
        cell.textLabel?.font = UIFont.lf_systemFont(ofSize: 14)
        cell.textLabel?.textColor = RGBColor(r: 51, g: 51, b: 51)
        cell.textLabel?.text  = "文荟人才公寓"
        return cell
    }
}
