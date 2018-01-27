//
//  ForgetPasswordViewController.swift
//  LDX_SwiftBase
//
//  Created by edz on 2018/1/26.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var ButPasswordEyes: UIButton!//输入密码
    
    @IBOutlet weak var ButAginPassEyes: UIButton!//再次输入密码
    
    @IBOutlet weak var ButCode: UIButton!//验证码获取
    
    @IBOutlet weak var TextPassword: UITextField!//密码
    
    @IBOutlet weak var TextAginPassword: UITextField!//确认密码
    
    @IBOutlet weak var TextPhone: UITextField!//手机号
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "忘记密码"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButCodeClick(_ sender: Any) {
        
        if TextPhone.text?.count == 0 {
            SwiftNotice.showText(TextPhone.placeholder!)
            return
        }
        
        sendButtonClick(ButCode)

    }
    
    //密码
    @IBAction func ButPassEyesClick(_ sender: Any) {
        if TextPassword.isSecureTextEntry == true {
            TextPassword.isSecureTextEntry = false
            ButPasswordEyes.setImage(UIImage(named: "login_kejian_pre"), for: .normal)
        }else
        {
            TextPassword.isSecureTextEntry = true
            ButPasswordEyes.setImage(UIImage(named: "Login_kejian"), for: .normal)
        }
    }
    //再次密码
    @IBAction func ButAginEyesClick(_ sender: Any) {
        if TextAginPassword.isSecureTextEntry == true {
            TextAginPassword.isSecureTextEntry = false
            ButAginPassEyes.setImage(UIImage(named: "login_kejian_pre"), for: .normal)
        }else
        {
            TextAginPassword.isSecureTextEntry = true
            ButAginPassEyes.setImage(UIImage(named: "Login_kejian"), for: .normal)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ButForgetClick(_ sender: Any) {
        dismiss(animated: true) {
//            let main = MainTabBarViewController()
//            self.view.window?.rootViewController = main as? UIViewController
            print("完成")
        }
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
