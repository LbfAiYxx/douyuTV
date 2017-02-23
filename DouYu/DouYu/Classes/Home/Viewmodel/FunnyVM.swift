//
//  FunnyVM.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/16.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

class FunnyVM:BaseVM{
    
}


extension FunnyVM{
    func loadData(back:@escaping ()->()){
        loadBaseData(isGroup: false, urlString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/3", parameters: ["limit" : 30 , "offset" : 0 ], back: back)
    }
}
