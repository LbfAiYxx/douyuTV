//
//  CommendViewController.swift
//  DouYu
//
//  Created by 刘冰峰 on 2016/12/19.
//  Copyright © 2016年 LBF. All rights reserved.
//

import UIKit
//定义常量

private let CycleViewH: CGFloat = CscreenW * 3/8
private let GameViewH: CGFloat = 90
class CommendViewController: BaseViewController {
    fileprivate   lazy var  gameView: GameView = {
        let gameview = GameView.gameView()
        
        return gameview
    }()
    fileprivate  lazy  var cycleView: CycleView = {
        let cycleView = CycleView.cycleView()
       
        return cycleView
        
        
    }()
    fileprivate lazy var commmendVM = CommendVM()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //设置UI界面
        setupCommendView()
        //请求网络
        requestData()
        
    }
}



extension CommendViewController{
    //设置推荐控制器UI界面
    func setupCommendView(){
        //view.addSubview(collectionview)
        //添加轮播器
        collectionview.addSubview(cycleView)
        cycleView.frame = CGRect.init(x: 0, y: -(CycleViewH + GameViewH), width: CscreenW, height: CycleViewH)
        collectionview.contentInset = UIEdgeInsets.init(top: CycleViewH + GameViewH, left: 0, bottom: 0, right: 0)
        
        //添加游戏板块
        
        collectionview.addSubview(gameView)
        gameView.frame = CGRect.init(x: 0, y: -GameViewH, width: CscreenW, height: GameViewH)
        
    
        
    
    }
}


extension CommendViewController{
   override func requestData(){
    
    //赋值
    baseVM = commmendVM
    //请求正文网络数据
    
    commmendVM.loadData { 
        self.collectionview.reloadData()
        
        var categorygroups = self.commmendVM.categoryGroups
        //删除前2组数据
        categorygroups.removeFirst()
        categorygroups.removeFirst()
        
        //添加的数据
        let group = CategoryGroup()
        group.icon_name = "更多"
        categorygroups.append(group)
        self.gameView.categoryGroups = categorygroups
        self.finishLoadData()
    }
    
        //请求轮播网络数据
    commmendVM.loadCycleData {
        
        self.cycleView.cycleModels = self.commmendVM.cycleModels
        
    }
    }
}



extension CommendViewController: UICollectionViewDelegateFlowLayout{
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  super.numberOfSections(in: collectionView)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return super.collectionView(collectionView, numberOfItemsInSection: section)
    }
   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categorygroup = baseVM.categoryGroups[indexPath.section]
        let anchorgroup = categorygroup.anchorGroups[indexPath.item]
        
        
        //var cell: UICollectionViewCell!
        
        if indexPath.section == 1 {
           let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "prettyCellID", for: indexPath) as! CollectionPrettyViewCell
          cell.anchor = anchorgroup
             return cell
        }else{
           let  cell = collectionview.dequeueReusableCell(withReuseIdentifier: "normalCellID", for: indexPath) as! CollectionNormalViewCell
          cell.anchor = anchorgroup
             return cell
        }
        
       
       
        
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize.init(width: CitemW, height: CprettyItemH)
        }else{
            return CGSize.init(width: CitemW, height: CitemH)
        }
    }
    
}
