//
//  HomeNavViewController.swift
//  DouYu
//
//  Created by 刘冰峰 on 2016/12/14.
//  Copyright © 2016年 LBF. All rights reserved.
//

import UIKit

class HomeNavViewController:UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    //设置UI界面
        setupUI()
    
        }
    
   

}



extension HomeNavViewController{
    fileprivate func setupUI(){
        //设置导航栏
    setUpNavigationBar()
    }
    private func setUpNavigationBar(){
        //设置左边item
    
       navigationItem.leftBarButtonItem = UIBarButtonItem.init(normalImageName: "logo")
        
        //设置右边item
        
        let frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        //设置Item
        let historyItem = UIBarButtonItem.init(normalImageName: "image_my_history", hightImageName: "Image_my_history_click", frame: frame)
        
        let searchItem  = UIBarButtonItem.init(normalImageName: "btn_search", hightImageName: "btn_search_clicked", frame: frame)
        
        let qrcodeItem = UIBarButtonItem.init(normalImageName: "btn_search_clicked-1", hightImageName:  "Image_scan_click", frame: frame)
        //添加Item
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]

        
        
        
        
    }
}
