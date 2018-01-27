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

//        tabBar.isTranslucent = false
        /// 首页
        let onePageVC = HomeViewController()
        addChildViewController(onePageVC,
                               title: "首页",
                               image: UIImage(named: "tab_1_1_nor"),
                               selectedImage: UIImage(named: "tab_1_1_pre"))
        
        /// 分类
        let classVC = TabBarSecViewController()
        addChildViewController(classVC,
                               title: "邻里信息",
                               image: UIImage(named: "tab_1_2_nor"),
                               selectedImage: UIImage(named: "tab_1_2_pre"))
        
        
        /// 书架
        let bookVC = TabBarThirViewController()
        addChildViewController(bookVC,
                               title: "购物车",
                               image: UIImage(named: "tab_1_3_nor"),
                               selectedImage: UIImage(named: "tab_1_3_pre"))
        
        
        /// 我的
        let mineVC = MeViewController()
        addChildViewController(mineVC,
                               title: "我的",
                               image: UIImage(named: "tab_1_4_nor"),
                               selectedImage: UIImage(named: "tab_1_4_pre"))
        
        
        
    }
    
    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {

        childController.tabBarItem = UITabBarItem(title: nil,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        childController.title = title
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        }
        addChildViewController(MainNavigationController(rootViewController: childController))
    }
    

}
















