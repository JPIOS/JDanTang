//
//  JDanTangCell.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/26.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit
import Kingfisher

class JDanTangCell: UICollectionViewCell {
    @IBOutlet weak var imgV: UIImageView!//图片
    @IBOutlet weak var descLb: UILabel!//描述
    @IBOutlet weak var priceLb: UILabel!//价格
    @IBOutlet weak var praiseLB: UILabel!//赞的个数
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cornerRadiu(radiu: 2)
    }
    
    func setModel(model:JDanTangModel) {
        
        /*
         这个框架和 SD_WebImage差不多
         options：[.transition(ImageTransition.fade(1))]（demo中看到，暂时不理解）
         progressBlock：进度显示
         image, error, cacheType, imageURL: 失败的回调 可分析失败原因
         */
        let url = URL.init(string: model.cover_image_url!)
        imgV.kf.setImage(with: url, placeholder: UIImage.init(named:"Me_ProfileBackground"), options:  [.transition(ImageTransition.fade(1))], progressBlock: { (receivedSize, totalSize) in
            
        }) { ( image, error, cacheType, imageURL ) in
            
        }
       
        
        descLb.text = model.name
        priceLb.text = model.price
        praiseLB.text = String.init(format: "%d", model.favorites_count!)
        
    }
}
