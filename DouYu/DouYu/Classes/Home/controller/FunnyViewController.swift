//
//  FunnyViewController.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/16.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

class FunnyViewController: BaseViewController {
    fileprivate lazy var funnyVM = FunnyVM()
}

extension FunnyViewController{
    override func requestData() {
       baseVM = funnyVM
       funnyVM.loadData { 
        self.collectionview.reloadData()
        self.finishLoadData()
    
    
        }
      
    }
}

extension FunnyViewController{
    override func setUpView() {
        super.setUpView()
       let layout = collectionview.collectionViewLayout as! UICollectionViewFlowLayout
       layout.headerReferenceSize = CGSize.zero
       collectionview.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
    }
}
