//
//  CollectionGameCell.swift
//  DouYu
//
//  Created by 刘冰峰 on 2017/1/10.
//  Copyright © 2017年 LBF. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    var category: BaseModel? {
        didSet{
            guard let category = category else {
                return
            }
            label.text = category.tag_name
            icon.kf.setImage(with: URL.init(string:category.icon_url), placeholder: UIImage.init(named: "home_more_btn"))
        }
    }
    
}
