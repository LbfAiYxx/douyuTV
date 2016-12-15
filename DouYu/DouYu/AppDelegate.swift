//
//  AppDelegate.swift
//  DouYu
//
//  Created by 刘冰峰 on 2016/12/14.
//  Copyright © 2016年 LBF. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //设置tabbar图标颜色
        UITabBar.appearance().tintColor = UIColor.orange
        return true
    }

  
}

