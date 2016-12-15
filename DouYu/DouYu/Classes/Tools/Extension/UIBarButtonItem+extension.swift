//
//  UIBarButtonItem+extension.swift
//  DouYu
//
//  Created by 刘冰峰 on 2016/12/14.
//  Copyright © 2016年 LBF. All rights reserved.
//

import UIKit



extension UIBarButtonItem{
    //便利构造函数快速创建
    convenience init(normalImageName:String, hightImageName: String = "", frame:CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)){
        //创建按钮
        let btn  = UIButton()
        //设置按钮
        btn.setImage(UIImage.init(named: normalImageName), for: .normal)
        //判断会否有参数
        if hightImageName != "" {
            btn.setImage(UIImage.init(named: hightImageName), for: .highlighted)
        }
        if frame != CGRect(x: 0, y: 0, width: 0, height: 0) {
            btn.frame = frame

        }else{
            btn.sizeToFit()
        }
        //初始化UIBarButtonItem
        self.init(customView:btn)
    }
}
