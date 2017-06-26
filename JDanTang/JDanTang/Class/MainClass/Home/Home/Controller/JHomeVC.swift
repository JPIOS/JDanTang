//
//  JHomeVC.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/8.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

import Alamofire

class JHomeVC: BaseVC {
 
    
   
    
    @IBOutlet weak var JTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JTF.setValue(UIColor.red, forKeyPath:"placeholderLabel.textColor")
        loadData()
        
    }
    
    
    
    func loadData(){
        //http://api.dantangapp.com/v1/channels/4/items?   gender=1&generation=1&limit=20&offset=0
        
        let id:Int = 4
        let url =  "v1/channels/\(id)/items"
        let params = ["gender":1,
                      "generation":1,
                      "limit":20,
                      "offset":0 ]
        NetworkTool.shareNetworkTool.getRequest(urlString: url, params: params, success: { (results) in
        
        }) { (faile) in
            
        }
  }
 
    
    
    
 
}
