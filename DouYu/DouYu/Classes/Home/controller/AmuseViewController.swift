//
//  AmuseViewController.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/11.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

private let CamuseMenuViewH: CGFloat = 200

class AmuseViewController: BaseViewController {
    
    fileprivate lazy var amuseVM = AmuseVM()
    
    fileprivate lazy var amuseView: AmuseMenuView = {
        let amuseView = AmuseMenuView.amuseView()
        
        amuseView.frame = CGRect(x: 0, y: -CamuseMenuViewH, width: CscreenW, height: CamuseMenuViewH)
        amuseView.autoresizingMask = UIViewAutoresizing()
       
        return amuseView
    }()
   


}


extension AmuseViewController{
    override func setUpView() {
        super.setUpView()
        collectionview.addSubview(amuseView)
        collectionview.contentInset = UIEdgeInsets(top: CamuseMenuViewH, left: 0, bottom: 0, right: 0)
    }
    
    
    
}



extension AmuseViewController{
     override func requestData(){
        //对父类进行赋值
        
        baseVM = amuseVM
        
        amuseVM.loadData { 
            self.collectionview.reloadData()
            var temArray = self.amuseVM.categoryGroups
            
            temArray.removeFirst()
            
            self.amuseView.amuseGroups = temArray
            self.finishLoadData()
        }
        
    }
}





