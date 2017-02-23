
//
//  AmuseView.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/15.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

class AmuseMenuView: UIView {
    
    var amuseGroups:[CategoryGroup]?{
        didSet{
            collectionView.reloadData()
        }
        
    }
    @IBOutlet weak var pagecontrol: UIPageControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "AmuseMenuViewCell", bundle: nil), forCellWithReuseIdentifier: "cellID")
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
    }
}


extension AmuseMenuView{
    
    class func amuseView()->AmuseMenuView{
        return Bundle.main.loadNibNamed("AmuseMenuView", owner: nil, options: nil)?.first as!AmuseMenuView
    }
}


extension AmuseMenuView: UICollectionViewDataSource{
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if amuseGroups == nil {
            return 0
        }
        pagecontrol.numberOfPages = (amuseGroups!.count - 1) / 8 + 1
        return (amuseGroups!.count - 1) / 8 + 1
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell (withReuseIdentifier: "cellID", for: indexPath) as! AmuseMenuViewCell
        
        comfirmAmuseGroups(cell: cell, indexPath:indexPath)

        
        return cell
    }
    
    private func comfirmAmuseGroups(cell:AmuseMenuViewCell,indexPath:IndexPath){
    let startIndex = indexPath.item * 8
    var endIndex =  (indexPath.item + 1) * 8 - 1
    
    
    if endIndex > amuseGroups!.count - 1{
    endIndex = amuseGroups!.count - 1
    }
    
    cell.amuseGroups = Array(amuseGroups![startIndex...endIndex])
}

}

extension AmuseMenuView:UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pagecontrol.currentPage = Int(scrollView.contentOffset.x / CscreenW)
    }
}


