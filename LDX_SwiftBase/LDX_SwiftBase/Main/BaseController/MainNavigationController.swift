//
//  MainNavigationController.swift
//  LDX_SwiftBase
//
//  Created by mac on 2017/12/22.
//  Copyright © 2017年 LDX. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationBar.setBackgroundImage(UIImage(named:"navigationbarBackgroundWhite"), for: .default)
        navigationBar.barTintColor = LDXBaseNav
//        navigationBar.barTintColor = UIColor(red: 37/255, green: 204/255, blue: 90/255, alpha: 1)
        navigationBar.titleTextAttributes = [.foregroundColor: RGBColor(r: 51, g: 51, b: 51)]
        //开启手势
        setUpPopGesTrue()
        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            let button = UIButton(type: .custom)
//            button.setTitle("返回", for: .normal)
            button.setImage(UIImage(named:"nav_1_back"), for: .normal)
            button.addTarget(self, action: #selector(back), for: .touchUpInside)
            button.setTitleColor( .darkGray, for: .normal)
            button.setTitleColor( .red, for: .highlighted)
            button.sizeToFit()
            button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
            button.contentHorizontalAlignment = .left
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .default
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//点击事件 =============
extension MainNavigationController{
    @objc func back() {
        popViewController(animated: true)
    }
}

//设置全屏pop手势
extension MainNavigationController{
    fileprivate func setUpPopGesTrue() {
        //1、使用运行时，打印手势中的所有属性
        guard let targets = interactivePopGestureRecognizer!.value(forKey: "_targets") as? [NSObject] else { return }
        let targetObjc = targets[0]
        let target = targetObjc.value(forKey: "target")
        let action = Selector(("handleNavigationTransition:"))
        
        let panGes = UIPanGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(panGes)
    }
}







