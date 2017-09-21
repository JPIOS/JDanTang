//
//	Target.swift
//
//	Create by 朋 家 on 9/7/2017
//	Copyright © 2017. All rights reserved.
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Target : NSObject {

	var bannerImageUrl : String!
	var coverImageUrl : String!
	var createdAt : Int!
	var id : Int!
	var postsCount : Int!
	var status : Int!
	var subtitle : String!
	var title : String!
	var updatedAt : Int!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		bannerImageUrl = dictionary["banner_image_url"] as? String
		coverImageUrl = dictionary["cover_image_url"] as? String
		createdAt = dictionary["created_at"] as? Int
		id = dictionary["id"] as? Int
		postsCount = dictionary["posts_count"] as? Int
		status = dictionary["status"] as? Int
		subtitle = dictionary["subtitle"] as? String
		title = dictionary["title"] as? String
		updatedAt = dictionary["updated_at"] as? Int
	}

	
}
