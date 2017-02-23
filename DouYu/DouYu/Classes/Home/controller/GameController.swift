//
//  GameController.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/10.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

private let CedgeMargin : CGFloat = 10

private let CheaderViewH : CGFloat = 50
private let CgameViewH : CGFloat = 90

class GameController: AnimationViewController {
    
    fileprivate lazy var gameVM = GameVM()
    
    fileprivate lazy var collecitonView: UICollectionView = {
        //设置布局
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: CitemW, height: CitemH )
        //设置头部尺寸
        layout.headerReferenceSize = CGSize.init(width: CscreenW, height: CheaderViewH)
        
        //创建collectionview
        let collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        
         collectionView.backgroundColor = UIColor.white
        collectionView.autoresizingMask = .flexibleWidth
        collectionView.autoresizingMask = .flexibleHeight
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: "cellID")
        //注册头部
        
        collectionView.register(UINib.init(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "hearderID")
        
        return collectionView
    }()
    
    fileprivate lazy var headerView: CollectionHeaderView = {
        let headerView = CollectionHeaderView.headerView()
        headerView.frame = CGRect.init(x: 0, y: -(CheaderViewH + CgameViewH), width: CscreenW, height: CheaderViewH)
        headerView.label.text = "常见"
        headerView.icon.image = UIImage.init(named: "Img_orange")
        headerView.btn.isHidden = true
        return headerView
    }()
    
    
    fileprivate lazy var gameView: GameView = {
        let gameView = GameView.gameView()
        gameView.frame = CGRect.init(x: 0, y: -CgameViewH, width: CscreenW, height: CgameViewH)
        return gameView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        //设置界面
        setUpView()
        //请求数据
        requestDate()
    }



}

extension GameController{
    override func setUpView() {
        view.addSubview(collecitonView)
        contentView = collecitonView
        
        collecitonView.addSubview(headerView)
        collecitonView.addSubview(gameView)
        collecitonView.contentInset = UIEdgeInsets.init(top: CgameViewH + CheaderViewH , left: 0, bottom: 0, right: 0)
        super.setUpView()
    }
}


extension GameController{
    fileprivate func requestDate(){
        
     gameVM.loadData { 
        self.collecitonView.reloadData()
        
        //let temArray = self.gameVM.gameModels[0..<10]
        //print(self.gameVM.gameModels.count)
        self.gameView.categoryGroups = Array(self.gameVM.gameModels[0..<10])
        self.finishLoadData()
        }
        
    }
}

extension GameController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameVM.gameModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as!CollectionGameCell
        cell.category = gameVM.gameModels[indexPath.item]
        //cell.backgroundColor = UIColor.random()
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let hearder = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:"hearderID", for: indexPath) as! CollectionHeaderView
        hearder.label.text = "全部"
        hearder.icon.image = UIImage.init(named: "Img_orange")
        hearder.btn.isHidden = true
        return hearder
    }
}




