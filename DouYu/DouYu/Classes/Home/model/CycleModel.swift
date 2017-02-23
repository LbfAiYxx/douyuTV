//
//  CycleModel.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/8.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    //主播模型
    var anchor: anchorGroup?
    //模型属性
    var title: String = ""
    var tv_pic_url: String = ""
    var room: [String: NSObject]?{
        //监听属性改变
        didSet{
            guard let room = room else {
                return
            }
            anchor = anchorGroup.init(dic: room)
        }
    }
    //初始化模型对象
    init(dic: [String: NSObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
