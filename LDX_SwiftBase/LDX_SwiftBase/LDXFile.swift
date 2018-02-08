//
//  LDXFile.swift
//  LDX_SwiftBase
//
//  Created by mac on 2017/12/25.
//  Copyright © 2017年 LDX. All rights reserved.
//

import Foundation
import UIKit

// 屏幕的宽
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

// 屏幕的高
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

let SCREEN_STATUS_BAR_HEIGHT = UIApplication.shared.statusBarFrame.height

// 设置比例
let d_width = SCREEN_WIDTH/375
let d_height = SCREEN_HEIGHT/667

//判断iPhone4
let IPHONE4_DEV:Bool! = (UIScreen.main.bounds.size.height == 480) ? true : false

//判断iPhone5/5c/5s
let IPHONE5_DEV:Bool! = (UIScreen.main.bounds.size.height == 568) ? true : false

//判断iPhone6/6s
let IPHONE6s_DEV:Bool! = (UIScreen.main.bounds.size.height == 667) ? true : false

//判断iPhone6p
let IPHONE6p_DEV:Bool! = (UIScreen.main.bounds.size.height > 667) ? true : false

//判断iPad
let IPAD_DEV:Bool! = (UIDevice.current.userInterfaceIdiom == .pad) ? true : false




/*/Users/mac/Desktop/LDX_SwiftBase/LDX_SwiftBase/Main/Controller
 默认颜色
 */
func RGBColor(r :CGFloat ,g:CGFloat,b:CGFloat) ->UIColor
{
    return UIColor(red: (r/255), green: (g/255), blue: (b/255), alpha: 1)
}

func RGBAColor(r :CGFloat ,g:CGFloat,b:CGFloat,a:CGFloat) ->UIColor
{
    return UIColor(red: (r/255), green: (g/255), blue: (b/255), alpha: a)
}


func Ridus(Rview : UIView, Ridus: CGFloat) {
    Rview.layer.cornerRadius = Ridus
    Rview.layer.masksToBounds = true
}

func Ridus(Rview : UIView, Ridus: CGFloat, borwidth: CGFloat, color: CGColor) {
    Rview.layer.cornerRadius = Ridus
    Rview.layer.masksToBounds = true
    Rview.layer.borderWidth = borwidth
    Rview.layer.borderColor = color
}
func RGBCOLOR_HEX(h:Int) ->UIColor {
    return RGBColor(r: CGFloat(((h)>>16) & 0xFF), g:   CGFloat(((h)>>8) & 0xFF), b:  CGFloat((h) & 0xFF))
}

let LDXBaseNav  =  RGBColor(r: 236.0, g: 189.0, b: 80.0)
let LDXBackColor  = RGBColor(r: 221.0, g: 221.0, b: 221.0)
let RLDXBaseNav  = RGBColor(r: 236.0, g: 189.0, b: 80.0).cgColor
let RLDXBackColor  = RGBColor(r: 221.0, g: 221.0, b: 221.0).cgColor
let LDX245BackColor  = RGBColor(r: 245.0, g: 245.0, b: 245.0)
let LDXQianYellowkColor  = RGBColor(r: 248.0, g: 229.0, b: 190.0)


/// 系统普通字体
var gof_SystemFontWithSize: (CGFloat) -> UIFont = {size in
    return UIFont.systemFont(ofSize: size);
}

/// 系统加粗字体
var gof_BoldFontWithSize: (CGFloat) -> UIFont = {size in
    return UIFont.boldSystemFont(ofSize: size);
}


/// 仅用于标题栏上，大标题字号
let kNavFont = gof_SystemFontWithSize(18);

/// 标题字号
let kTitleFont = gof_SystemFontWithSize(18);

/// 正文字号
let kBodyFont = gof_SystemFontWithSize(13);

/// 辅助字号
let kAssistFont = gof_SystemFontWithSize(14);


// 测试外网
let kIPAddress = "https://recruit.mppstore.com"
//系统签名
let kSignName = "fd4002886ad2b079"
//首页
let kPointUrl = "/Api/Index/index"//首页

//MARK:获取字符串的宽度的封装
func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
    
    let statusLabelText: NSString = labelStr as NSString
    
    let size = CGSize(width: 900, height: height)
    
    let dic = NSDictionary(object: font, forKey: NSAttributedStringKey.font as NSCopying)
    
    let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : Any], context:nil).size
    
    return strSize.width
}

//使用
//let md5String = someString.md5()

//MARK: ==========MD5加密方法=========
//MD5加密方法：
func md5String(str:String) -> String{
    let cStr = str.cString(using: String.Encoding.utf8);
    let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
    CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
    let md5String = NSMutableString();
    for i in 0 ..< 16{
        md5String.appendFormat("%02x", buffer[i])
    }
    free(buffer)
    return md5String as String
}
//func md5(_ input: String) -> String {
//    let cStr = input.utf8CString
//    let digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
//    CC_MD5(cStr, strlen(cStr), digest)
//    // This is the md5 call
//    var output: String = "" /* TODO: .reserveCapacity(CC_MD5_DIGEST_LENGTH * 2) */
//    for i in 0..<CC_MD5_DIGEST_LENGTH {
//        output += String(format: "%02x", digest[i])
//    }
//    return output
//}

//MARK: ==========正则表达式=========
//1.验证邮箱

//func validateEmail(email: String) -> Bool {
//    let emailString = "[A-Z0-9a-z._% -] @[A-Za-z0-9.-] \\.[A-Za-z]{2,4}"
//    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailString)
//    return emailPredicate.evaluate(with: email)
//}

    //2.验证手机号

    func validatePhonoNum(phono: String) -> Bool {
        //手机号以13,15,17,18开头，八个 \d 数字字符
        let phoneString = "^((13[0-9])|(15[^4,\\D]) |(17[0,0-9])|(18[0,0-9]))\\d{8}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneString)
        return phonePredicate.evaluate(with: phono)
    }
//
//
//    //3.验证车牌号
//    class func validateCarNum(car: String) -> Bool {
//        var carString = "^[A-Za-z]{1}[A-Za-z_0-9]{5}$"
//        var carPredicate = NSPredicate(format: "SELF MATCHES %@", carString)
//        return carPredicate.evaluateWithObject(car)
//    }
//
//    //4.验证用户名
//    class func validateUserName(name: String) -> Bool {
//        var userNameRegex = "^[A-Za-z0-9]{6,20}+$"
//        var userNamePredicate = NSPredicate(format: "SELF MATCHES %@", userNameRegex)
//        var peopleName = userNamePredicate.evaluateWithObject(name)
//        return peopleName
//    }
//
    //5.验证密码
    func validatePassword(passWord: String) -> Bool {
        let passWordRegex = "^[a-zA-Z0-9]{6,20}+$"
        let passWordPredicate = NSPredicate(format: "SELF MATCHES%@", passWordRegex)
        return passWordPredicate.evaluate(with: passWord)
    }
//
//    //6.验证昵称
//    class func validateNickname(nickname: String) -> Bool {
//        var nicknameRegex = "^[\u{4e00}-\u{9fa5}]{4,8}$"
//        var passWordPredicate = NSPredicate(format: "SELF MATCHES%@", nicknameRegex)















