//
//  BaseModel.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/10.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
  
    var tag_name: String = ""
   
    var icon_url: String = ""
    
    //从写构造方法
    override init() {
        
    }
    
    
    //初始化模型对象
    init(dic: [String: NSObject]) {
        //实例化对象
        super.init()
        //kvc赋值
        setValuesForKeys(dic)
    }
    //从写方法，防止报错,因为字典中有key没有赋值
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }


}
