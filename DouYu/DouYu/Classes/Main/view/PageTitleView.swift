//
//  PageTitleView.swift
//  DouYu
//
//  Created by 刘冰峰 on 2016/12/15.
//  Copyright © 2016年 LBF. All rights reserved.
//

import UIKit

protocol titleViewDelegate : class {
    //协议方法
    func titleView(selectedIndex Index : Int)
}


fileprivate let CbtnLine = 2

class PageTitleView: UIView {
    //自定义属性
    fileprivate var  titles : [String]
    fileprivate var  oldIndex = 0
    fileprivate var  btnLine :UIView?
    fileprivate var  grayColor : (CGFloat,CGFloat,CGFloat) = (85,85,85)
    fileprivate var orangeColor : (CGFloat,CGFloat,CGFloat) = (255,128,0)
    //设置代理属性(设置代理最好用weak 而且是可选)
    weak var delegate : titleViewDelegate?
    //懒加载属性
    fileprivate  lazy var  labels = [UILabel]()
    
    //懒加载scrollview
    fileprivate lazy var scrollview :UIScrollView = {
       let scrollview = UIScrollView()
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.scrollsToTop = false
        scrollview.bounces = false
        return scrollview
    }()
    
    //自定义View，重载构造函数
    init(frame: CGRect,titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
    //设置自定义View界面
    setUpChildView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension PageTitleView{
        //添加子控件
    fileprivate func setUpChildView() {
        //添加scrollView
        addSubview(scrollview)
        scrollview.frame = bounds
        //添加label
        setUplabels()
        //添加下划线
        setUpBtnLine()
        //添加分隔线
        setUpTitleViewLine()
    }
    
    
    
    private func setUplabels() {
        let labelW = CscreenW/CGFloat(titles.count)
        let labelH = frame.height - CGFloat(CbtnLine)
        let labelY = 0
        
        for (index,title) in titles.enumerated() {
            let label = UILabel()
            //设置标题和文字属性
            label.text = title
            label.tag = index
            label.textColor = UIColor.gray
            label.textAlignment = .center
            //设置frame
            let labelX = labelW * CGFloat(index)
            label.frame = CGRect.init(x: labelX, y: CGFloat(labelY), width: labelW, height: labelH)
            //添加label
            scrollview.addSubview(label)
            labels.append(label)
            //使label监听点击
            label.isUserInteractionEnabled = true
            //创建手势
            let tap = UITapGestureRecognizer.init(target: self, action:#selector(changeClick(tap:)))
            //添加手势
            label.addGestureRecognizer(tap)
            
            
        }
    }
    
    
    private func setUpBtnLine(){
        let btnLine = UIView()
        self.btnLine = btnLine
        guard let label = labels.first else {
            return
        }
        label.textColor = UIColor.orange
        btnLine.backgroundColor = UIColor.orange
        //设置第一个下划线大小
        btnLine.frame = CGRect.init(x: label.frame.origin.x, y: frame.height - CGFloat(CbtnLine), width:label.frame.width, height:CGFloat (CbtnLine))
        scrollview.addSubview(btnLine)
   }
    
    private func setUpTitleViewLine(){
        let titleViewLine = UIView()
        titleViewLine.frame = CGRect.init(x: frame.origin.x, y: frame.height - 0.5, width: frame.width, height: 0.5)
        titleViewLine.backgroundColor = UIColor.lightGray
        addSubview(titleViewLine)
        
    }
    
}


extension PageTitleView{
    @objc fileprivate func changeClick(tap: UITapGestureRecognizer){
        //拿到当前标签
        guard let currentLabel = tap.view as? UILabel else{return}
        
        //之前标签
        let oldLabel = labels[oldIndex]
       
        //改变标签颜色
        oldLabel.textColor = UIColor.gray
        currentLabel.textColor = UIColor.orange
        
        //赋值
        oldIndex = currentLabel.tag
        
        //改变下划线位置
        let  btnLineX = CGFloat(oldIndex) * currentLabel.frame.width
        //添加动画
        self.btnLine?.frame.origin.x = btnLineX
        //通知代理
        delegate?.titleView(selectedIndex: currentLabel.tag)
        
        
    }
}

extension PageTitleView{
    func  changeIndex(progress: CGFloat,currentIndex: Int, oldIndex: Int){
        //拿到标签
        let oldLabel = labels[oldIndex]
        
        let currentLabel = labels[currentIndex]
        
        //改变下划线位置
        let moveX = currentLabel.frame.origin.x - oldLabel.frame.origin.x
        btnLine?.frame.origin.x = moveX * progress + oldLabel.frame.origin.x
        
        //渐变文字颜色
        //1.变化范围
        let colorArea = (orangeColor.0 - grayColor.0,orangeColor.1 - grayColor.1,orangeColor.2 - grayColor.2)
        //原来颜色
        oldLabel.textColor = UIColor.init(a: orangeColor.0 - colorArea.0 * progress
            , b: orangeColor.1 - colorArea.1 * progress
            , c: orangeColor.2 - colorArea.2 * progress)
        //当前颜色
        currentLabel.textColor = UIColor.init(a: grayColor.0 + colorArea.0 * progress, b: grayColor.1 + colorArea.1 * progress, c: grayColor.2 + colorArea.2 * progress)
        
    }
}
