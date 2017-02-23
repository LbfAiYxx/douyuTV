//
//  BaseViewController.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/12.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

 let CitemMargin: CGFloat = 10
 let CitemW = (CscreenW - 3 * CitemMargin)/2
 let CitemH = CitemW * 3/4
 let CprettyItemH = CitemW * 4/3
 let CheardViewH: CGFloat = 50

class BaseViewController: AnimationViewController {
     var baseVM: BaseVM!
     lazy var collectionview: UICollectionView = {
        //设置布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: CitemW, height: CitemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = CitemMargin
        //设置组头
        layout.headerReferenceSize = CGSize.init(width: CscreenW, height:CheardViewH )
        //每组内边距
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        //创建collectionView
        let collectionview = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        collectionview.backgroundColor = UIColor.white
        //自动随控制器View拉伸
        collectionview.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(UINib.init(nibName: "CollectionNormalViewCell", bundle: nil), forCellWithReuseIdentifier: "normalCellID")
        
        collectionview.register(UINib.init(nibName: "CollectionPrettyViewCell", bundle: nil), forCellWithReuseIdentifier: "prettyCellID")
        
        collectionview.register(UINib.init(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")
        
        
        return collectionview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        requestData()
        
    
      
    }

}



extension BaseViewController{
    override func setUpView() {
       
        contentView = collectionview
        view.addSubview(collectionview)
       
    
        
        
        super.setUpView()
    }
}


extension BaseViewController{
     func requestData(){
        
        }
    }


extension BaseViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseVM.categoryGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseVM.categoryGroups[section].anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"normalCellID", for: indexPath) as! CollectionNormalViewCell
        cell.anchor = baseVM.categoryGroups[indexPath.section].anchorGroups[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionview.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! CollectionHeaderView
        
        headerView.hearGroup = baseVM.categoryGroups[indexPath.section]
        return headerView
        
        
    }
}



extension BaseViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = baseVM.categoryGroups[indexPath.section].anchorGroups[indexPath.item]
        
        cell.isVertical == 0 ? computerRoom() : mobileRoom()
        
        
        
    }
    
    
    private func computerRoom(){
        let computerRoom = ComputerViewController()
        
        navigationController?.pushViewController(computerRoom, animated: true)
    }

    private func mobileRoom(){
        let mobileRoom = MobileViewController()
        present(mobileRoom, animated: true, completion: nil)
    }
    
}
