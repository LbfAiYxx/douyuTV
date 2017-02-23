//
//  CollectionBaseCell.swift
//  DouYu
//
//  Created by 刘冰峰 on 2016/12/23.
//  Copyright © 2016年 LBF. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionBaseCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var online: UIButton!
    @IBOutlet weak var icon: UIImageView!
    
    
    var anchor: anchorGroup?{
        didSet{
            guard let anchor = anchor  else {
                return
            }
            name.text = anchor.nickname
            
            if anchor.online >= 10000 {
                online.setTitle("\(anchor.online/10000)万人在线", for: .normal)
                
            }else{
                online.setTitle("\(anchor.online)人在线", for: .normal)
            }
           icon.kf.setImage(with: URL.init(string: anchor.vertical_src))
            
        }
    }

}
