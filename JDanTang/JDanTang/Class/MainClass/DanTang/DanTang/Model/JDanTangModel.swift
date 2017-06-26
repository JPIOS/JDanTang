//
//  JDanTangModel.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/19.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit
import ObjectMapper

class JDanTangModel: NSObject{
    //1
    var brand_id:String?
    var brand_order:String?
    var category_id:String?
    var cover_image_url:String?
    var created_at:String?
    
    var Description:String?
    var editor_id:String?
    var favorites_count:String?
    var id:String?
    var image_urls:Array<String>?
   
    var is_favorite:String?
    var purchase_id:String?
    var price:String?
    var purchase_status:String?
    var purchase_type:String?
    
    var purchase_url:String?
    var updated_at:String?
    var url:String?
    
    
    
    class func getItem(json:[String:Any]) -> JDanTangModel {
        
        let item = JDanTangModel();
        item.brand_id = json["brand_id"] as? String;
        item.brand_order = json["brand_order"] as? String;
        item.category_id = json["category_id"] as? String;
        item.cover_image_url = json["cover_image_url"] as? String;
        item.created_at = json["created_at"] as? String;
        
        item.Description = json["description"] as? String;
        item.editor_id = json["editor_id"] as? String;
        item.favorites_count = json["favorites_count"] as? String;
        item.id = json["id"] as? String;
        item.image_urls = json["image_urls"] as? Array;
        
        item.is_favorite = json["is_favorite"] as? String;
        item.purchase_id = json["purchase_id"] as? String;
        item.price = json["price"] as? String;
        item.purchase_status = json["purchase_status"] as? String;
        item.purchase_type = json["purchase_type"] as? String;
        
        item.purchase_url = json["purchase_url"] as? String;
        item.updated_at = json["updated_at"] as? String;
        item.url = json["url"] as? String;
        return item;
        
    }
    
    func mapping(map: Map) { // 3
        brand_id <- map["brand_id"]
        brand_order <- map["brand_order"]
        category_id <- map["category_id"]
        cover_image_url <- map["cover_image_url"]
        created_at <- map["created_at"]
       
        Description <- map["Description"]
        editor_id <- map["editor_id"]
        favorites_count <- map["favorites_count"]
        id <- map["id"]
        image_urls <- map["image_urls"]
       
        is_favorite <- map["is_favorite"]
        purchase_id <- map["purchase_id"]
        price <- map["price"]
        purchase_status <- map["purchase_status"]
        purchase_type <- map["purchase_type"]
        
        purchase_url <- map["purchase_url"]
        updated_at <- map["updated_at"]
        url <- map["url"]
 
    }

}


 
