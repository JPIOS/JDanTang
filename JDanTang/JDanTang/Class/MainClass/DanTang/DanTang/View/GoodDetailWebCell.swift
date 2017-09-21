//
//  GoodDetailWebCell.swift
//  JDanTang
//
//  Created by 家朋 on 2017/8/1.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

import SnapKit

class GoodDetailWebCell: UITableViewCell {

    
    private let webView :UIWebView! = UIWebView()
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
         self.addSubview(webView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
