//
//  ChoicenessBannerIten.swift
//  JDanTang
//
//  Created by 家朋 on 2017/7/9.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

class ChoicenessBannerIten: NSObject {
    
    var channel : String!
    var id : Int!
    var imageUrl : String!
    var order : Int!
    var status : Int!
    var target : Target!
    var targetId : Int!
    var targetUrl : String!
    var type : String!
    
    
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    init(fromDictionary dictionary: NSDictionary){
        channel = dictionary["channel"] as? String
        id = dictionary["id"] as? Int
        imageUrl = dictionary["image_url"] as? String
        order = dictionary["order"] as? Int
        status = dictionary["status"] as? Int
        if let targetData = dictionary["target"] as? NSDictionary{
            target = Target(fromDictionary: targetData)
        }
        targetId = dictionary["target_id"] as? Int
        targetUrl = dictionary["target_url"] as? String
        type = dictionary["type"] as? String
    }
    
 
}


