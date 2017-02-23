//
//  BaseVM.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/12.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

class BaseVM {
    lazy var categoryGroups: [CategoryGroup] = [CategoryGroup]()
}


extension BaseVM {
    func loadBaseData(isGroup: Bool,urlString: String,parameters:[String: Any]? = nil,back: @escaping ()->()){
        NetWorkingTool.requestData(type: .get, urlString: urlString, parameters: parameters) { (result) in
            guard let resultDic = result as? [String: NSObject] else {return}
            guard let dicArray = resultDic["data"] as? [[String:NSObject]] else {return}
            
            if isGroup {
                    for dic in dicArray{
                    self.categoryGroups.append(CategoryGroup(dic: dic))
                }
                }else{
                    let categoryGroups = CategoryGroup()
                    for dic in dicArray{
                categoryGroups.anchorGroups.append(anchorGroup(dic: dic))
                    }
                
                
                self.categoryGroups.append(categoryGroups)
            }
            back()
        }
    }
    
}
  

                    
               
                        
    
