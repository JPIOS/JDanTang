//
//  ChoicenessCell.swift
//  JDanTang
//
//  Created by mac_KY on 2017/7/1.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

import Kingfisher

class ChoicenessCell: UITableViewCell {
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var backImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.likeBtn.backgroundColor = JColor(r: 51, g: 51, b: 51, a: 0.8)
        self.likeBtn.cornerRadiu(radiu: likeBtn.height)
        backImageView.cornerRadiu(radiu: 4)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

         
    }
    
    func setModel(model:ChoicenessModel) {
      
        self.likeBtn.setTitle(String(model.likesCount), for: UIControlState.normal)
        contentLabel.text = model.title
        
        let url = URL.init(string: model.coverImageUrl)
        backImageView.kf.setImage(with: url, placeholder: UIImage.init(named:"Me_ProfileBackground"), options:  [.transition(ImageTransition.fade(1))], progressBlock: { (receivedSize, totalSize) in
            
        }) { ( image, error, cacheType, imageURL ) in
            
        }
        
   
    }
    
}
 
