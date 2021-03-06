//
//  AppDelegate.swift
//  LDX_SwiftBase
//
//  Created by mac on 2017/12/22.
//  Copyright © 2017年 LDX. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Alamofire
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let manager = NetworkReachabilityManager(host: kIPAddress)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = false
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.backgroundColor = UIColor.white
        let rootViewController = MainTabBarViewController()
        rootViewController.delegate = self
        window!.rootViewController = rootViewController
        window!.makeKeyAndVisible()

        /**
        检测网络状态
        **/
        NetworkReachManager()
        
        /**
         适配iOS11
         **/
        adaptationIOS_11()
        /**
         引导页
         **/
        LaunchIntroductionView.shared(withImages: ["ltimg", "ltimg1", "ltimg2"])

        
        // Override point for customization after application launch.
        return true
    }
    
    private func NetworkReachManager()
    {
        manager!.listener = { status in
            switch status {
            case .notReachable:
            UNoticeBar(config: UNoticeBarConfig(title: "检测到您的网络不可使用")).show(duration: 2)
                print("notReachable")
            case .unknown:
                UNoticeBar(config: UNoticeBarConfig(title: "网络错误")).show(duration: 2)
                print("unknown")
            case .reachable(.ethernetOrWiFi):
            UNoticeBar(config: UNoticeBarConfig(title: "检测到您正在使用Wi-Fi")).show(duration: 2)
                print("ethernetOrWiFi")
            case .reachable(.wwan):
            UNoticeBar(config: UNoticeBarConfig(title: "检测到您正在使用移动数据")).show(duration: 2)
                print("wwan")
                
            }
        }
        manager!.startListening()
    }
    
    //MARK: 适配iOS11
    private func adaptationIOS_11()->Void{
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
            UITableView.appearance().contentInsetAdjustmentBehavior = .never
            UICollectionView.appearance().contentInsetAdjustmentBehavior = .never
            UITableView.appearance().estimatedRowHeight = 0
            UITableView.appearance().estimatedSectionFooterHeight = 0
            UITableView.appearance().estimatedSectionHeaderHeight = 0
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
extension AppDelegate: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("\(viewController)")
    }
}






