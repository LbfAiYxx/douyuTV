//
//  MainTabBarViewController.swift
//  DouYu
//
//  Created by 刘冰峰 on 2016/12/14.
//  Copyright © 2016年 LBF. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //添加子导航控制器
        setUpChildVc(nameVc: "Home")
        setUpChildVc(nameVc: "Live")
        setUpChildVc(nameVc: "Follow")
        setUpChildVc(nameVc: "Profile")
        
    }

     ///添加4个子导航控制器
    private func setUpChildVc(nameVc : String){
        //从storyboard加载子控制器
        let chileVc = UIStoryboard(name: nameVc, bundle: nil).instantiateInitialViewController()
        //添加子控制器
        addChildViewController(chileVc!)

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
