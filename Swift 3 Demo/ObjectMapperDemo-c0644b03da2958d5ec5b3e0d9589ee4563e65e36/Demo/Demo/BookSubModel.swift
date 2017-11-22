//
//  BookSubModel.swift
//  Demo
//
//  Created by ZGY on 2016/12/30.
//  Copyright © 2016年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2016/12/30  15:31
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import ObjectMapper

class BookSubModel: NSObject ,Mappable{
    
    var name:String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        name <- map["name"]
        
    }

}
