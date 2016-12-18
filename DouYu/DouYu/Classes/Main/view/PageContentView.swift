//
//  PageContentView.swift
//  DouYu
//
//  Created by 刘冰峰 on 2016/12/15.
//  Copyright © 2016年 LBF. All rights reserved.
//

import UIKit
protocol contentViewDelegate : class{
    func contentView(progress: CGFloat,currentIndex: Int,oldIndex:Int)
}

class PageContentView: UIView {
    fileprivate var oldOffsetX :CGFloat = 0
    fileprivate var currentOffsetX :CGFloat = 0
    fileprivate var currentIndeX = 0
    fileprivate var oldIndeX = 0
    
    weak var delegate: contentViewDelegate?
    
    fileprivate var childVc: [UIViewController]
    //解除循环引用
    fileprivate weak var parentcontroller: UIViewController?
    //懒加载collectionView
    fileprivate lazy var collectionView :UICollectionView = { [weak self] in
        //设置布局
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        //强行解包
        layout.itemSize = (self?.bounds.size)!
        layout.scrollDirection = .horizontal
        //创建collectionView
       let collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.delegate = self as UICollectionViewDelegate?
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        
        
         return collectionView
   }()
    
    init(frame: CGRect,childVc: [UIViewController],parentcontroller: UIViewController?) {
        self.childVc = childVc
        self.parentcontroller = parentcontroller
        super.init(frame: frame)
        //添加scrollView
        setUpCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




extension PageContentView{
    //添加collectionView
    fileprivate func setUpCollectionView(){
        //添加子控制器到父控制器中
        for childvc in childVc {
            parentcontroller?.addChildViewController(childvc)
        }
        addSubview(collectionView)
        collectionView.frame = bounds
        
    }
    
}


extension PageContentView : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVc.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        //移除循环利用里面的View
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        //添加控制器视图在cell里面
        childVc[indexPath.item].view.frame = cell.contentView.frame
        cell.contentView.addSubview(childVc[indexPath.item].view)
        
        return cell
    }
}


extension PageContentView{
    //对外暴露方法，传值
    func changeIndex(Index : Int){
        //计算平移量
        let offsetX = CGFloat(Index) * CscreenW
        collectionView.contentOffset.x = offsetX
        
    }
}

extension PageContentView : UICollectionViewDelegate{
        //监听滚动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //动态偏移量
       currentOffsetX = scrollView.contentOffset.x
        
        //设置进度条变量
       var progress :CGFloat = 0
        
        //左滑动、滚动进度
       if currentOffsetX > oldOffsetX {
             progress = (currentOffsetX - oldOffsetX)/CscreenW
            }
        //右滑动进度条
       if currentOffsetX < oldOffsetX {
            progress = 1 - ((currentOffsetX - oldOffsetX)/CscreenW)
        }
        
        //右滑动，当每滑动一页时设置当前下标和原来小标
       if (( oldOffsetX - currentOffsetX) / CscreenW == 1 ) ||
            ((oldOffsetX - currentOffsetX) / CscreenW == 2 ) ||
            ((oldOffsetX - currentOffsetX ) / CscreenW == 3 ) {
            oldOffsetX = currentOffsetX
            currentIndeX = Int(oldOffsetX/CscreenW)
            if currentIndeX <= 2 {
                oldIndeX = currentIndeX + 1
            }
            
        }
       //左滑动，当每滑动一页时设置当前下标和原来小标
       if ((currentOffsetX - oldOffsetX) / CscreenW == 1 )||((currentOffsetX - oldOffsetX) / CscreenW == 2 )||((currentOffsetX - oldOffsetX) / CscreenW == 3 ) {
            oldOffsetX = currentOffsetX
            currentIndeX = Int(currentOffsetX/CscreenW)
           if currentIndeX >= 1 {
               oldIndeX = currentIndeX - 1
           }
    
       }
    
      //通知代理
      delegate?.contentView(progress: progress, currentIndex: currentIndeX, oldIndex: oldIndeX)
    }
    
}
