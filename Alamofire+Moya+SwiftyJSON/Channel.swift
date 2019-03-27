//
//	Channel.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON

struct Channel{

	var abbrEn : String!
	var channelId : Int!
	var name : String!
	var nameEn : String!
	var seqId : Int!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		abbrEn = dictionary["abbr_en"] as? String
		channelId = dictionary["channel_id"] as? Int
		name = dictionary["name"] as? String
		nameEn = dictionary["name_en"] as? String
		seqId = dictionary["seq_id"] as? Int
	}
    
    init(fromJson Json: JSON) {
        abbrEn = Json["abbr_en"].string ?? ""
        channelId = Json["channel_id"].int ?? 0
        name = Json["name"].string ?? ""
        nameEn = Json["name_en"].string ?? ""
        seqId = Json["seq_id"].int ?? 0
    }

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
        let dictionary = NSMutableDictionary()
		if abbrEn != nil{
			dictionary["abbr_en"] = abbrEn
		}
		if channelId != nil{
			dictionary["channel_id"] = channelId
		}
		if name != nil{
			dictionary["name"] = name
		}
		if nameEn != nil{
			dictionary["name_en"] = nameEn
		}
		if seqId != nil{
			dictionary["seq_id"] = seqId
		}
		return dictionary
	}

}
