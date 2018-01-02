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

func RGBCOLOR_HEX(h:Int) ->UIColor {
    return RGBColor(r: CGFloat(((h)>>16) & 0xFF), g:   CGFloat(((h)>>8) & 0xFF), b:  CGFloat((h) & 0xFF))
}

let LDXBaseNav  =  RGBColor(r: 37.0, g: 204.0, b: 90.0)
let RLDXBaseNav  =  RGBColor(r: 37.0, g: 204.0, b: 90.0).cgColor


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
let kBodyFont = gof_SystemFontWithSize(16);

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
