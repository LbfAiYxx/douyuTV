//
//  GameView.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/10.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

class GameView: UIView {
    //模型属性
    var categoryGroups: [BaseModel]?{
        didSet{
            
            
            collectionView.reloadData()
        }
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
       
        super.awakeFromNib()
        //消除自动伸缩
        autoresizingMask = UIViewAutoresizing()
        
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: "cellID")
        
        
        
    }
   
    
    
}


extension GameView{
    class func gameView()->GameView{
        return Bundle.main.loadNibNamed("GameView", owner: nil, options: nil)?.first as! GameView
    }
}



extension GameView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryGroups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CollectionGameCell
        
        cell.category = categoryGroups?[indexPath.item]
        
        return cell
    }
}








