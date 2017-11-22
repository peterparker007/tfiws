//
//  BookModel.swift
//  Demo
//
//  Created by ZGY on 2016/12/30.
//  Copyright © 2016年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2016/12/30  13:15
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import ObjectMapper
class BookModel:NSObject,Mappable{
    
    var subtitle: String = ""
    var pubdate: String = ""
    var alt: String = ""
    var id: String = ""
    var gyTest: String = ""
    var author: [BookSubModel]?
    var desp:String = "" //description 与独有属性有冲突
    required init?(map: Map) {

        
    }
    
    func mapping(map: Map) {
        
//        var count: UInt32 = 0
//        
//        let myClasss:AnyClass = self.classForCoder
//        
//        let properties = class_copyPropertyList(myClasss, &count)
//        
//        for i in 0..<count {
//            
//            let property = properties?[Int(i)]
//            let cname = property_getName(property)
//            var name = String.init(cString: cname!)
//            
//            name.characters <- map["\(name)"]
//            
//        }
        
        self.subtitle <- map["subtitle"]

        subtitle <- map["subtitle"]
        pubdate <- map["pubdate"]
        alt <- map["alt"]
        id <- map["id"]
        gyTest <- map["gyTest"]
        author <- map["author"]
        desp <- map["description"]
    }
    

}
