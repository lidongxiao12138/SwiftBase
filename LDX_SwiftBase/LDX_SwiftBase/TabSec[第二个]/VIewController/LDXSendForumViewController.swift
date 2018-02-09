//
//  LDXSendForumViewController.swift
//  LDX_SwiftBase
//
//  Created by cherry pu on 2018/2/8.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class LDXSendForumViewController: BaseViewController,UIScrollViewDelegate,LDXSendForumSearchViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,LDXSendExhibitionImageViewDelegate {
    private var imageContentView:UIView = UIView.init()
    private var addButton:UIButton = UIButton.init()
    private let imageWidth = (SCREEN_WIDTH-UIView.lf_size(fromIphone6: 56))/4
    private var scrollView = UIScrollView.init()
    private var searchView = LDXSendForumSearchView.init(frame: CGRect(x:0,y:0,width:0,height:0))
    private var typeScrollView = UIScrollView.init()
    private let imagePickerController:UIImagePickerController = UIImagePickerController.init()
    private var imageViewArray:NSMutableArray = []
    
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
        self.imagePickerController.delegate = self
        self.imagePickerController.navigationBar.isTranslucent = false;

        let scrollView:UIScrollView = UIScrollView.init()
        scrollView.delegate = self
        self.scrollView = scrollView
        scrollView.delegate = self
        scrollView.bounces = true
        scrollView.isScrollEnabled = true
        self.view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(self.view).offset(UIView.lf_size(fromIphone6: SCREEN_STATUS_BAR_HEIGHT+44))
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
        
        let typeScrollView:UIScrollView = UIScrollView.init()
        self.typeScrollView = typeScrollView
        scrollView.addSubview(typeScrollView)
        
        typeScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(imageContentView.snp.bottom).offset(UIView.lf_size(fromIphone6: 15))
            make.left.equalTo(scrollView)
            make.size.equalTo(CGSize(width:SCREEN_WIDTH,height:UIView.lf_size(fromIphone6: 22)))
        }
        
        let typeView:LDXSendForumTypeView = LDXSendForumTypeView.init(typeArray: ["闲聊","买卖","晒妹子","闲聊","买卖","晒妹子","闲聊","买卖","晒妹子","闲聊","买卖","晒妹子"], frame: CGRect(x:0,y:0,width:0,height:0))
        typeScrollView.addSubview(typeView)
        
        typeView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(typeScrollView)
            make.right.equalTo(typeScrollView).offset(UIView.lf_size(fromIphone6: -12))
        }
        
        let searchView:LDXSendForumSearchView = LDXSendForumSearchView.init(frame: CGRect(x:0,y:0,width:0,height:0))
        searchView.delegate = self
        self.searchView = searchView
        scrollView.addSubview(searchView)
        
        searchView.snp.makeConstraints { (make) in
            make.top.equalTo(typeScrollView.snp.bottom).offset(UIView.lf_size(fromIphone6: 15))
            make.left.equalTo(scrollView).offset(UIView.lf_size(fromIphone6: 12))
            make.size.equalTo(CGSize(width:SCREEN_WIDTH-UIView.lf_size(fromIphone6: 24),height:UIView.lf_size(fromIphone6: 157)))
            make.bottom.equalTo(scrollView)
        }
    }
    
    func sendForumBeginEdit() {
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.searchView.endEditing(true)
    }
    
    @objc func handleClickAddButton ()
    {
        self.view.endEditing(true)
        let actionSheetView:UIAlertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheetView.view.tintColor = RGBColor(r: 236, g: 189, b: 80)
        let cancelButton:UIAlertAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        let camerlButton:UIAlertAction = UIAlertAction.init(title: "拍照", style: .default) { (action) in
            self.handleClickPhoto(sourceType: .camera)
        }
        let photoButton:UIAlertAction = UIAlertAction.init(title: "相册", style: .default) { (action) in
            self.handleClickPhoto(sourceType: .photoLibrary)
        }
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            actionSheetView.addAction(camerlButton)
        }
        actionSheetView.addAction(photoButton)
        actionSheetView.addAction(cancelButton)
        self.present(actionSheetView, animated: true, completion: nil)
    }
    
    func handleClickPhoto(sourceType:UIImagePickerControllerSourceType)  {
        let authorizationStatus:AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        if authorizationStatus == AVAuthorizationStatus.denied || authorizationStatus == AVAuthorizationStatus.restricted {
            let mainInfoDictionary:NSDictionary = Bundle.main.infoDictionary! as NSDictionary
            let appName = mainInfoDictionary["CFBundleDisplayName"] as! String
            let tipTextWhenNoPhotosAuthorization = ("请在设备的\"设置-隐私-相机\"选项中，允许"+appName+"访问你的相机")
            
            let alertView:UIAlertController = UIAlertController.init(title: nil, message: tipTextWhenNoPhotosAuthorization, preferredStyle: .alert)
            let cancelButton:UIAlertAction = UIAlertAction.init(title: "确定", style: .cancel, handler: nil)
            alertView.addAction(cancelButton)
            
            self.present(alertView, animated: true, completion: nil)
            return
        }
        
        self.imagePickerController.sourceType = sourceType
        self.present(self.imagePickerController, animated: true, completion: nil)
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if navigationController.isKind(of: UIImagePickerController.self) {
            navigationController.navigationBar.tintColor = RGBColor(r: 236, g: 189, b: 80)
            navigationController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:RGBColor(r: 236, g: 189, b: 80),NSAttributedStringKey.font:UIFont.lf_systemFont(ofSize: 18)]
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true) {
            let originalImage:UIImage = info["UIImagePickerControllerOriginalImage"] as! UIImage
            let imageView:LDXSendExhibitionImageView = LDXSendExhibitionImageView.init(image: originalImage, frame: CGRect(x:0,y:0,width:0,height:0))
            imageView.delegate = self
            self.imageContentView.addSubview(imageView)
            
            imageView.snp.makeConstraints({ (make) in
                make.top.equalTo(self.imageContentView).offset((self.imageWidth+UIView.lf_size(fromIphone6: 10))*(CGFloat(self.imageViewArray.count/4)))
                make.left.equalTo(self.imageContentView).offset((self.imageWidth+UIView.lf_size(fromIphone6: 10))*(CGFloat( self.imageViewArray.count%4)))
                make.size.equalTo(CGSize(width:self.imageWidth,height:self.imageWidth))
            })
            
            self.imageViewArray.add(imageView)
            
            if self.imageViewArray.count == 9 {
                self.addButton.isHidden = true
            }else {
                self.addButton.isHidden = false
            }
            self.addButton.snp.remakeConstraints({ (make) in
                make.top.equalTo(self.imageContentView).offset((self.imageWidth+UIView.lf_size(fromIphone6: 10))*(CGFloat(self.imageViewArray.count/4)))
                make.left.equalTo(self.imageContentView).offset((self.imageWidth+UIView.lf_size(fromIphone6: 10))*(CGFloat(self.imageViewArray.count%4)))
                make.size.equalTo(CGSize(width:self.imageWidth,height:self.imageWidth))
                make.bottom.equalTo(self.imageContentView)
            })
        }
    }
    
    func sendExhibitionImageViewClickDeleteButton(imageView: LDXSendExhibitionImageView) {
        let index = self.imageViewArray.index(of: imageView)
        self.imageViewArray .removeObject(at: index)
        
        if index == self.imageViewArray.count || self.imageViewArray.count == 0 {
            self.addButton.snp.remakeConstraints({ (make) in
                make.top.equalTo(self.imageContentView).offset((self.imageWidth+UIView.lf_size(fromIphone6: 10))*(CGFloat(self.imageViewArray.count/4)))
                make.left.equalTo(self.imageContentView).offset((self.imageWidth+UIView.lf_size(fromIphone6: 10))*(CGFloat(self.imageViewArray.count%4)))
                make.size.equalTo(CGSize(width:self.imageWidth,height:self.imageWidth))
                make.bottom.equalTo(self.imageContentView)
            })
        }
        imageView.removeFromSuperview()
        
        var i = 0
        while i<self.imageViewArray.count {
            let imageView:LDXSendExhibitionImageView = self.imageViewArray[i] as! LDXSendExhibitionImageView
            imageView.snp.remakeConstraints({ (make) in
                make.top.equalTo(self.imageContentView).offset((self.imageWidth+UIView.lf_size(fromIphone6: 10))*(CGFloat(i/4)))
                make.left.equalTo(self.imageContentView).offset((self.imageWidth+UIView.lf_size(fromIphone6: 10))*(CGFloat( i%4)))
                make.size.equalTo(CGSize(width:self.imageWidth,height:self.imageWidth))
            })
            
            if i == (self.imageViewArray.count - 1) {
                self.addButton.snp.remakeConstraints({ (make) in
                    make.top.equalTo(self.imageContentView).offset((self.imageWidth+UIView.lf_size(fromIphone6: 10))*(CGFloat((i+1)/4)))
                    make.left.equalTo(self.imageContentView).offset((self.imageWidth+UIView.lf_size(fromIphone6: 10))*(CGFloat((i+1)%4)))
                    make.size.equalTo(CGSize(width:self.imageWidth,height:self.imageWidth))
                    make.bottom.equalTo(self.imageContentView)
                })
            }
            i += 1
        }
        self.addButton.isHidden = false
    }
}
