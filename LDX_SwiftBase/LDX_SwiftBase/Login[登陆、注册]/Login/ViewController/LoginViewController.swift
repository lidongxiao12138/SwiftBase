//
//  LoginViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/1/25.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit
import Alamofire//数据
import SwiftyJSON//类型转译
import MJRefresh//下拉刷新
import JQProgressHUD//小菊花
class LoginViewController: BaseViewController {

    @IBOutlet weak var ViewPhone: UIView!//登录View
    
    @IBOutlet weak var ViewPassword: UIView!//密码View
    
    @IBOutlet weak var ButForget: UIButton!//忘记密码按钮
    
    @IBOutlet weak var ButLoginSure: UIButton!//登录
    
    @IBOutlet weak var ButEyes: UIButton!//小眼睛
    
    @IBOutlet weak var TextPhone: UITextField!//电话
    
    @IBOutlet weak var TextPassword: UITextField!//密码
    
    //MARK:----------- 数据加载接口
    //注册
    func requsetLogin()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "登录"
        ViewRaidusBorWidth(View: ViewPhone, Radius: 3, BorWidth: 1, Color: RLDXBackColor)
        ViewRaidusBorWidth(View: ViewPassword, Radius: 3, BorWidth: 1, Color: RLDXBackColor)
        
        //添加左侧返回
        CreatNavLeft()
        // Do any additional setup after loading the view.
    }
    //左侧返回
    func CreatNavLeft() {
        let image:UIImage = UIImage(named: "nav_2_1_back")!
        let bar = UIBarButtonItem.init(image: image.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: .plain, target: self, action: #selector(barBackClick))

        navigationItem.leftBarButtonItem = bar
        
    }
    //返回按钮事件
    @objc func barBackClick(){
        dismiss(animated: true) {
            
        }
    }
    //注册确定按钮
    @IBAction func ButRegisterClick(_ sender: Any) {
        let regist = RegistViewController()
        navigationController?.pushViewController(regist, animated: true)
    }
    //忘记密码
    @IBAction func ButForgetPassword(_ sender: Any) {
        let forget = ForgetPasswordViewController()
        navigationController?.pushViewController(forget, animated: true)
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
    
    @IBAction func ButLoginSureClick(_ sender: Any) {
        dismiss(animated: true) {
//            let main = MainTabBarViewController()
//            self.view.window?.rootViewController = main as? UIViewController
            print("完成")
        }
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
