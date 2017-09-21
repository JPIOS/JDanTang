//
//  JHomeHeaderItem.swift
//  JDanTang
//
//  Created by 家朋 on 2017/7/8.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

class JHomeHeaderItem: NSObject {

    var id: Int?
    var name: String?
    var editable :Bool?
    
    
    class func getHomeHeaderItem(json:[String:Any]) -> JHomeHeaderItem {
        
        let item = JHomeHeaderItem();
        item.id = json["id"] as? Int;
        item.name = json["name"] as? String;
        item.editable = json["editable"] as? Bool;
        
        return item;
        
    }
}
