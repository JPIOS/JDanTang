//
//  ChoicenessModel.swift
//  JDanTang
//
//  Created by 家朋 on 2017/7/31.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

class ChoicenessModel: NSObject {
 
    
    var contentUrl : String!
    var coverImageUrl : String!
    var createdAt : Int!
    var editorId : AnyObject!
    var id : Int!
    var labels : [AnyObject]!
    var liked : Bool!
    var likesCount : Int!
    var publishedAt : Int!
    var shareMsg : String!
    var shortTitle : String!
    var status : Int!
    var template : String!
    var title : String!
    var type : String!
    var updatedAt : Int!
    var url : String!
    
    
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    init(fromDictionary dictionary: NSDictionary){
        contentUrl = dictionary["content_url"] as? String
        coverImageUrl = dictionary["cover_image_url"] as? String
        createdAt = dictionary["created_at"] as? Int
        editorId = dictionary["editor_id"] as? AnyObject
        id = dictionary["id"] as? Int
        labels = dictionary["labels"] as? [AnyObject]
        liked = dictionary["liked"] as? Bool
        likesCount = dictionary["likes_count"] as? Int
        publishedAt = dictionary["published_at"] as? Int
        shareMsg = dictionary["share_msg"] as? String
        shortTitle = dictionary["short_title"] as? String
        status = dictionary["status"] as? Int
        template = dictionary["template"] as? String
        title = dictionary["title"] as? String
        type = dictionary["type"] as? String
        updatedAt = dictionary["updated_at"] as? Int
        url = dictionary["url"] as? String
    }
    

}
