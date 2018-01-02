//
//  MainTabBarViewController.swift
//  LDX_SwiftBase
//
//  Created by mac on 2017/12/22.
//  Copyright © 2017年 LDX. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //通过 appearance统一设置tabbarItem统一设置文字属性
        // 通过 appearance统一设置UITabBarItem的文字属性，属性后面带UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置

        let tabBar = UITabBarItem.appearance()
        let arrtrs_Normal = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.gray]
        let arrtrs_Select = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor:LDXBaseNav]
        tabBar.setTitleTextAttributes(arrtrs_Normal, for: .normal)
        tabBar.setTitleTextAttributes(arrtrs_Select, for: .selected)
        setupUI()
        // Do any additional setup after loading the view.
    }
}
extension MainTabBarViewController {
    fileprivate func setupUI() {
        let vcArray:[UIViewController] = [HomeViewController(), TabBarSecViewController(), TabBarThirViewController(), MeViewController()]
        let titleArray = [("首页","home"),("SecondVC","TabBarSec"),("ThirdVC","TabBarThird"),("我的","me")]
        for (index, vc) in vcArray.enumerated() {
            vc.tabBarItem.title = titleArray[index].0
            vc.tabBarItem.image = UIImage(named: "icon_\(titleArray[index].1)_nor")
            vc.tabBarItem.selectedImage = UIImage(named: "icon_\(titleArray[index].0)_pree")
            let nav = MainNavigationController(rootViewController: vc)
            addChildViewController(nav)

        }
    }
}
















