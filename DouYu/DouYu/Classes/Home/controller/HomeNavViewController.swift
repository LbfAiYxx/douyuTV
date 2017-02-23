//
//  HomeNavViewController.swift
//  DouYu
//
//  Created by 刘冰峰 on 2016/12/14.
//  Copyright © 2016年 LBF. All rights reserved.
//

import UIKit
private let CtitleH = 40
private let CtabbarH = 49
class HomeNavViewController:UIViewController {
      //懒加载自定义标题栏
    fileprivate lazy var titleView :PageTitleView = { [weak self] in        //定义frame
        let titleFrame = CGRect.init(x: 0, y: CstatusBarH + CnavBarH, width: Int(CscreenW), height: CtitleH)
        //定义标题
        let titles = ["推荐","游戏","娱乐","趣玩"]
        //调用构造函数创建
        let titleView = PageTitleView.init(frame: titleFrame, titles: titles)
        //设置控制器为代理
        titleView.delegate = self
        
        return titleView
        }()
    
    //懒加载自定义中间View
    fileprivate lazy var contentView :PageContentView = { [weak self] in
        //确定frame
        let contentFrame = CGRect.init(x: 0, y:CGFloat(CstatusBarH + CnavBarH + CtitleH), width: CscreenW, height: CscreenH - CGFloat(CstatusBarH + CnavBarH + CtitleH + CtabbarH))
        //确定子控制器组
        var childVcs = [UIViewController]()
         
        
        childVcs.append(CommendViewController())
        childVcs.append(GameController())
        childVcs.append(AmuseViewController())
        childVcs.append(FunnyViewController())
      
        //创建自定义contentView
        let contentView = PageContentView.init(frame: contentFrame, childVc: childVcs, parentcontroller: self)
        //设置contentView代理
        
        contentView.delegate = self as contentViewDelegate?
        return contentView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //设置UI界面
        setupUI()
    
        }
    
   

}



extension HomeNavViewController{
    fileprivate func setupUI(){
        //不需要scrollView内边距
        automaticallyAdjustsScrollViewInsets = false
        //设置导航栏
        setUpNavigationBar()
        //设置标题栏
        view.addSubview(titleView)
        //设置中间视图
        view.addSubview(contentView)
        //contentView.backgroundColor = UIColor.orange
        
    }
    private func setUpNavigationBar(){
        //设置左边item
    
       navigationItem.leftBarButtonItem = UIBarButtonItem.init(normalImageName: "logo")
        
        //设置右边item
        
        let frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        //设置Item
        let historyItem = UIBarButtonItem.init(normalImageName: "image_my_history", hightImageName: "Image_my_history_click", frame: frame)
        
        let searchItem  = UIBarButtonItem.init(normalImageName: "btn_search", hightImageName: "btn_search_clicked", frame: frame)
        
        let qrcodeItem = UIBarButtonItem.init(normalImageName: "btn_search_clicked-1", hightImageName:  "Image_scan_click", frame: frame)
        //添加Item
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]

        
        
        
        
    }
}



extension HomeNavViewController : titleViewDelegate{
    //遵守协议
    func titleView( selectedIndex Index: Int) {
       contentView.changeIndex(Index: Index)
    }
}

extension HomeNavViewController :contentViewDelegate{
    func contentView(progress: CGFloat, currentIndex: Int, oldIndex: Int) {
        titleView.changeIndex(progress: progress, currentIndex: currentIndex, oldIndex: oldIndex)
         
    }
}
