//
//  AmuseMenuViewCell.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/15.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

class AmuseMenuViewCell: UICollectionViewCell {
    
    var amuseGroups:[CategoryGroup]?{
        didSet{
            
            collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       collectionView.dataSource = self
       collectionView.register(UINib.init(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: "cellID")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemW = collectionView.bounds.size.width / 4
        let itemH = collectionView.bounds.size.height / 2
        layout.itemSize = CGSize(width: itemW, height: itemH)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        //layout.scrollDirection = .horizontal
        
    }

}


extension AmuseMenuViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return amuseGroups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CollectionGameCell
        cell.category = amuseGroups?[indexPath.item]
        cell.clipsToBounds = true
        return cell
        
    }
}
