//
//  NSDate+Extention.swift
//  DouYu
//
//  Created by 刘冰峰 on 2016/12/19.
//  Copyright © 2016年 LBF. All rights reserved.
//

import UIKit

extension Date{
    static func getNowTime() -> String{
        let date = Date()
        
        let time = Int(date.timeIntervalSince1970)
        return "\(time)"
    }
}
