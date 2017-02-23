//
//  CycleCell.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/8.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit
import Kingfisher

class CycleCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    
    var cycleModel: CycleModel?{
        didSet{
            guard let cycleModel = cycleModel else {
               return
            }
            
            label.text = cycleModel.title
            icon.kf.setImage(with: URL.init(string: cycleModel.tv_pic_url))
        }
    }
}
