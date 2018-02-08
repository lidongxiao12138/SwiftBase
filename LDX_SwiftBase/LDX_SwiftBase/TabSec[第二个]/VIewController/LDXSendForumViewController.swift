//
//  LDXSendForumViewController.swift
//  LDX_SwiftBase
//
//  Created by cherry pu on 2018/2/8.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class LDXSendForumViewController: BaseViewController,UIScrollViewDelegate {

    private var imageContentView:UIView = UIView.init()
    private var addButton:UIButton = UIButton.init()
    private let imageWidth = (SCREEN_WIDTH-UIView.lf_size(fromIphone6: 56))/4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavi()
        self.setUpSendForumView()
    }
    
    func setUpNavi()  {
        navigationItem.title = "发帖"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let image:UIImage = UIImage(named: "nav_2_1_back")!
        let bar = UIBarButtonItem.init(image: image.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: .plain, target: self, action: #selector(barBackClick))
        navigationItem.leftBarButtonItem = bar
        
        let sendButton:UIButton = UIButton.init(frame: CGRect(x:0,y:0,width:UIView.lf_size(fromIphone6: 44),height:UIView.lf_size(fromIphone6: 22)))
        sendButton.backgroundColor = RGBColor(r: 51, g: 51, b: 51)
        sendButton.layer.cornerRadius = UIView.lf_size(fromIphone6: 2)
        sendButton.layer.masksToBounds = true
        sendButton.setTitle("发布", for: .normal)
        sendButton.setTitleColor(RGBColor(r: 236, g: 189, b: 80), for: .normal)
        sendButton.titleLabel?.font = UIFont.lf_systemFont(ofSize: 16)
        sendButton.addTarget(self, action: #selector(handleClickSendButton), for: .touchUpInside)
        let rightItem = UIBarButtonItem.init(customView: sendButton)
        navigationItem.rightBarButtonItem = rightItem
        
        self.view.backgroundColor = UIColor.white
    }

    @objc func barBackClick()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleClickSendButton()
    {
        
    }
    
    func setUpSendForumView() {
        let scrollView:UIScrollView = UIScrollView.init()
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(SCREEN_STATUS_BAR_HEIGHT+44, 0, 0, 0))
        }
        
        let textView = MBTextView.init()
        textView.placeholder = "分享新鲜事儿~"
        textView.font = UIFont.lf_systemFont(ofSize: 15)
        scrollView.addSubview(textView)
        
        textView.snp.makeConstraints { (make) in
            make.left.equalTo(scrollView).offset(UIView.lf_size(fromIphone6: 13))
            make.top.equalTo(scrollView).offset(UIView.lf_size(fromIphone6: 13))
            make.size.equalTo(CGSize(width:SCREEN_WIDTH-UIView.lf_size(fromIphone6: 26),height:UIView.lf_size(fromIphone6: 128)))
        }
        
        let imageContentView:UIView = UIView.init()
        self.imageContentView = imageContentView
        scrollView.addSubview(imageContentView)
        
        imageContentView.snp.makeConstraints { (make) in
            make.top.equalTo(textView.snp.bottom).offset(UIView.lf_size(fromIphone6: 13))
            make.left.equalTo(textView)
            make.width.equalTo(SCREEN_WIDTH-UIView.lf_size(fromIphone6: 26))
        }
        
        let addButton:UIButton = UIButton.init()
        self.addButton = addButton
        addButton.setImage(UIImage.init(named: "icon_add"), for: .normal)
        addButton.addTarget(self, action: #selector(handleClickAddButton), for: .touchUpInside)
        imageContentView.addSubview(addButton)
        
        addButton.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(imageContentView)
            make.size.equalTo(CGSize(width:self.imageWidth,height:self.imageWidth))
        }
    }
    
    @objc func handleClickAddButton ()
    {
        self.view.endEditing(true)
        let actionSheetView:UIAlertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheetView.view.tintColor = RGBColor(r: 236, g: 189, b: 80)
        let cancelButton:UIAlertAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        let camerlButton:UIAlertAction = UIAlertAction.init(title: "拍照", style: .default) { (action) in
            
        }
        let photoButton:UIAlertAction = UIAlertAction.init(title: "相册", style: .default) { (action) in
            
        }
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            actionSheetView.addAction(camerlButton)
        }
        actionSheetView.addAction(photoButton)
        actionSheetView.addAction(cancelButton)
        self.present(actionSheetView, animated: true, completion: nil)
    }
}
