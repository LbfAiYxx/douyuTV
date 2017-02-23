//
//  NetWorkingTool.swift
//  DouYu
//
//  Created by 刘冰峰 on 2016/12/19.
//  Copyright © 2016年 LBF. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class NetWorkingTool{
    class func requestData(type:MethodType,urlString: String,parameters: [String: Any]?,completion: @escaping (_ result: Any)->()){
        //请求方式
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        //发送网络请求
        Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { (response) in
            //获取结果
         guard let result = response.result.value else {
                return
            }
            //回调结果
            completion(result)
        }

    }
}
