//
//  NSObject+GYExtension.swift
//  Demo
//
//  Created by ZGY on 2016/12/30.
//  Copyright © 2016年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2016/12/30  14:11
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

extension NSObject {
    
    
    func propertyNames() -> [String] {
        
        var results = [String]()
        
        var count: UInt32 = 0
        
        let myClasss:AnyClass = self.classForCoder
        
        let properties = class_copyPropertyList(myClasss, &count)
        
        for i in 0..<count {
            
            let property = properties?[Int(i)]
            let cname = property_getName(property)
            
            let name = String.init(cString: cname!)
            
            results.append(name)
            
        }
        
        return results
        
    }
    
}
