
//
//  AmuseVM.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/11.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

class AmuseVM:BaseVM {
    
 }
//"http://capi.douyucdn.cn/api/v1/getHotRoom/2"

extension AmuseVM{
    func loadData(back: @escaping ()->()){
        loadBaseData(isGroup: true,urlString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", parameters: nil, back: back)
                }
    }

