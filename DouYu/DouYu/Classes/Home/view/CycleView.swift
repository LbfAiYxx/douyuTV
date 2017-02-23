//
//  CycleView.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/7.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

class CycleView: UIView {
    //设置定时器
    var cycleTimer: Timer?
     //设置模型属性
    var cycleModels: [CycleModel]?{
        didSet{
            self.collectionView.reloadData()
            
            self.pagecontrol.numberOfPages = self.cycleModels?.count ?? 0
            
            //设置从左边开始滚动 到某一位置
            let indexPath = IndexPath.init(item: (cycleModels?.count ?? 0) * 100, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
            
            //添加定时器
            removeCycleTimer()
            addCycleTimer()
            
        }
    }
    //控件属性
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    //fileprivate lazy var layout = UICollectionViewFlowLayout()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //不自动拉伸
        autoresizingMask = UIViewAutoresizing()
        //注册cell
        collectionView.backgroundColor = UIColor.green
       
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "CycleCell", bundle: nil), forCellWithReuseIdentifier: "cellID")
        

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //设置布局
        let  layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
    }
    
}


extension CycleView {
    //类方法创建轮播view
    class func cycleView()->CycleView{
        return Bundle.main.loadNibNamed("CycleView", owner: nil, options: nil)?.first as! CycleView
    }
}

extension CycleView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (cycleModels?.count ?? 0) * 10000
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as!CycleCell
        cell.cycleModel = (cycleModels?[indexPath.item % (cycleModels?.count ?? 1)])
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.brown : UIColor.gray
        return cell
    }
    
    
}


extension CycleView: UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //计算偏移量
        let offsetX = scrollView.contentOffset.x
        //计算当前
        pagecontrol.currentPage = Int(offsetX / CscreenW) % (cycleModels?.count ?? 1)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
}

extension CycleView{
    //创建定时器
    fileprivate func addCycleTimer(){
        cycleTimer = Timer.init(timeInterval: 2.0, target: self, selector: #selector(scrollNext), userInfo: nil, repeats: true)
        
        //添加到主运行时里面
        RunLoop.main.add(cycleTimer!, forMode: RunLoopMode.commonModes)
    }
    
    //移除定时器
    fileprivate func removeCycleTimer(){
        //从运行时中移除
        cycleTimer?.invalidate()
        cycleTimer = nil
        
    }
    
    
    @objc fileprivate func scrollNext(){
        //当前偏移量
        let offsetX = collectionView.contentOffset.x + CscreenW
        
        collectionView.setContentOffset(CGPoint.init(x: offsetX, y: 0), animated: false)
        
    }
    
}

