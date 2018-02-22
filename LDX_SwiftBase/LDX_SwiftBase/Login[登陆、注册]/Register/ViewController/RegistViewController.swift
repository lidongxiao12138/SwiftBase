//
//  RegistViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/1/26.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit
import Alamofire//数据
import SwiftyJSON//类型转译
import MJRefresh//下拉刷新
import JQProgressHUD//小菊花
class RegistViewController: UIViewController {

    @IBOutlet weak var ViewPhone: UIView!//电话
    
    @IBOutlet weak var ViewCode: UIView!//验证码
    
    @IBOutlet weak var ViewPassword: UIView!//密码
    
    @IBOutlet weak var ViewArea: UIView!//区域
    
    @IBOutlet weak var ButCode: UIButton!//验证码按钮
    
    @IBOutlet weak var TextPhone: UITextField!//手机号
    
    @IBOutlet weak var TextCode: UITextField!//验证码
    
    @IBOutlet weak var TextPassword: UITextField!//密码
    
    @IBOutlet weak var TextArea: UITextField!//社区
    
    @IBOutlet weak var ButEyes: UIButton!//小眼睛

    @IBOutlet weak var ButRegist: UIButton! //注册
    //MARK: ==========创建计时器=========
    var countdownTimer: Timer!
    
    
    //创建计时器
    var remainingSeconds: Int = 0 {
        willSet {
            ButCode.setTitle("(\(newValue)秒后重新获取)", for: .normal)
            
            if newValue <= 0 {
                ButCode.setTitle("重新获取验证码", for: .normal)
                isCounting = false
            }
        }
    }
    
    var isCounting = false {
        willSet {
            if newValue {
                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(RegistViewController.updateTime(_:)), userInfo: nil, repeats: true)
                
                remainingSeconds = 60
                
            } else {
                countdownTimer?.invalidate()
                countdownTimer = nil
            }
            
            ButCode.isEnabled = !newValue
        }
    }
    func sendButtonClick(_ sender: UIButton) {
        isCounting = true
    }
    
    @objc func updateTime(_ timer: Timer) {
        remainingSeconds -= 1
    }
    
    //MARK:----------- 数据加载接口
    //注册
    func requsetRegist()
    {
        JQProgressHUDTool.jq_showNormalHUD()
        
        let params:Dictionary = ["sign" : kSignName]
        let UrlStr = kIPAddress+kPointUrl
        print(UrlStr)
        Alamofire.request(UrlStr, method: .post, parameters: params).responseJSON { (response) in
            switch response.result.isSuccess {
            case true:
                let jsonStr = JSON.init(response.result.value as Any)

                //MARK:=========== 加载轮播图 ==============
//                    self.loadCycleView()
//                    //MARK:=========== 取消小菊花 ==============
//                    self.homeCollection.reloadData()
                
            case false:
                //MARK:=========== 取消小菊花 ==============
                JQProgressHUDTool.jq_hideHUD()
                JQProgressHUDTool.jq_showNormalHUD(msg:"网络错误")
                print(response.result.error as Any)
            }
                print("获取数据成功")
        
            JQProgressHUDTool.jq_hideHUD()
            //MARK:=========== 取消小菊花 ==============
//            self.homeCollection.mj_header.endRefreshing()
        }
    }
    //验证码
    func requsetCode()
    {
        JQProgressHUDTool.jq_showNormalHUD()
        
        let params:Dictionary = ["sign" : kSignName]
        let UrlStr = kIPAddress+kPointUrl
        print(UrlStr)
        Alamofire.request(UrlStr, method: .post, parameters: params).responseJSON { (response) in
            switch response.result.isSuccess {
            case true:
                let jsonStr = JSON.init(response.result.value as Any)
                
                //                    //MARK:=========== 取消小菊花 ==============
                //                    self.homeCollection.reloadData()
                
            case false:
                //MARK:=========== 取消小菊花 ==============
                JQProgressHUDTool.jq_hideHUD()
                JQProgressHUDTool.jq_showNormalHUD(msg:"网络错误")
                print(response.result.error as Any)
            }
            print("获取数据成功")
            
            JQProgressHUDTool.jq_hideHUD()
            //MARK:=========== 取消小菊花 ==============
            //            self.homeCollection.mj_header.endRefreshing()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "注册"

        ViewRaidusBorWidth(View: ViewPhone, Radius: 3, BorWidth: 1, Color: RLDXBackColor)
        
        ViewRaidusBorWidth(View: ViewCode, Radius: 3, BorWidth: 1, Color: RLDXBackColor)
        
        ViewRaidusBorWidth(View: ViewPassword, Radius: 3, BorWidth: 1, Color: RLDXBackColor)
        
        ViewRaidusBorWidth(View: ViewArea, Radius: 3, BorWidth: 1, Color: RLDXBackColor)
        
        ViewRaidusBorWidth(View: ButRegist, Radius: 4, BorWidth: 0, Color: RLDXBackColor)

        
       

        // Do any additional setup after loading the view.
    }

    //MARK: ==========按钮方法=========
    //返回登录
    @IBAction func ButLoginClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    //验证码
    @IBAction func ButCodeClick(_ sender: Any) {
        if TextPhone.text?.count == 0 {
            SwiftNotice.showText(TextPhone.placeholder!)
            return
        }
        sendButtonClick(ButCode)
    }

    
    
    //注册
    @IBAction func ButRegistSureClick(_ sender: Any) {
        
        if  checkFile().count > 0 {
            SwiftNotice.showText(checkFile())
            return
        }
        else
        {
            dismiss(animated: true) {
//                let main = MainTabBarViewController()
//                self.view.window?.rootViewController = main as? UIViewController
                print("完成")
            }
            //MARK: ==========加载接口位置=========
            //加载接口
            
        }
        
    }
    //小眼睛
    @IBAction func ButEyesClick(_ sender: Any) {
        if TextPassword.isSecureTextEntry == true {
            TextPassword.isSecureTextEntry = false
            ButEyes.setImage(UIImage(named: "login_kejian_pre"), for: .normal)
        }else
        {
            TextPassword.isSecureTextEntry = true
            ButEyes.setImage(UIImage(named: "Login_kejian"), for: .normal)
        }
    }
    func checkFile() -> String {
        if TextPhone.text?.count == 0 {
            return TextPhone.placeholder!
        }
        if TextCode.text?.count == 0 || validatePassword(passWord: TextCode.text!) {
            return TextCode.placeholder!
        }
        if validatePhonoNum(phono: TextPhone.text!) {
            return "请输入正确的手机号"
        }

        
        return ""
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
