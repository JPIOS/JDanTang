//
//  JDanTangCell.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/26.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

class JDanTangCell: UICollectionViewCell {
    @IBOutlet weak var imgV: UIImageView!//图片
    @IBOutlet weak var descLb: UILabel!//描述
    @IBOutlet weak var priceLb: UILabel!//价格
    @IBOutlet weak var praiseLB: UILabel!//赞的个数
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setModel(model:JDanTangModel) {
        let url = URL.init(string: model.url!)
        imgV.kf.setImage(with: url)
        
        descLb.text = model.Description
        priceLb.text = model.price
        praiseLB.text = model.favorites_count
        
    }

}
