
//
//  AnimationViewController.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/16.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
        var contentView: UIView?
        lazy var animationView: UIImageView = { [unowned self] in
        
        let animationView = UIImageView(image: UIImage.init(named: "img_loading_1"))
        animationView.center = self.view.center
        animationView.animationImages = [UIImage.init(named: "img_loading_1")!,UIImage.init(named: "img_loading_2")!]
        animationView.animationDuration = 0.5
        animationView.autoresizingMask = [.flexibleTopMargin,.flexibleBottomMargin]
        
        return animationView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        
    }

   

}

extension AnimationViewController{
    func setUpView() {
        contentView?.isHidden = true
        view.addSubview(animationView)
        animationView.startAnimating()
        
    }
    
    func finishLoadData(){
        animationView.stopAnimating()
        animationView.isHidden = true
        contentView?.isHidden = false
    }
}
