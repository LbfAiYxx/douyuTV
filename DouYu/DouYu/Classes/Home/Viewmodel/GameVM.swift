//
//  GameVM.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/10.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

class GameVM {
    lazy var gameModels: [GameModel] = [GameModel]()
}


extension GameVM{
    func loadData(back:@escaping ()->()){
      NetWorkingTool.requestData(type: .get, urlString: "http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters: ["shortName" : "game"]) { (result) in
        guard let resultDic = result as? [String: NSObject] else {return}
        guard let dicArray = resultDic["data"] as? [[String: NSObject]]else {return}
        
        for dic in dicArray {
            self.gameModels.append(GameModel(dic: dic))
            
           
        }
         back()
        }
        
    }
}
