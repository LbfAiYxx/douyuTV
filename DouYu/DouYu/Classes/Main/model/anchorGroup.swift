//
//  anchorGroup.swift
//  DouYu
//
//  Created by 刘冰峰 on 2016/12/20.
//  Copyright © 2016年 LBF. All rights reserved.
//

import UIKit

class anchorGroup: NSObject {
    var room_id: Int = 0
    var vertical_src: String = ""
    var nickname: String = ""
    var online: Int = 0
    var isVertical: Int = 0
    var anchor_city: String = ""
    
    
    
    init(dic: [String: Any]) {
        super.init()
        setValuesForKeys(dic)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    
    }
    
    
}
