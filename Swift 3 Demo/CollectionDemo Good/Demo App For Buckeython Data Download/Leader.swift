//
//  Leader.swift
//  Demo App For Buckeython Data Download
//
//  Created by Taha Topiwala on 10/28/16.
//  Copyright © 2016 Taha Topiwala. All rights reserved.
//

import Foundation

class Leader {
    
    private var name : String!
    private var email : String!
    private var role : String!
    private var image : String!
    private var detail : String?
    
    init(leaderData : AnyObject?) {
        if let data = leaderData as? Dictionary<String, AnyObject> {
            if let name = data["name"] as? String {
                self.name = name
            }
            if let email = data["email"] as? String {
                self.email = email
            }
            if let role = data["role"] as? String {
                self.role = role
            }
            if let image = data["image"] as? String {
                self.image = image
            }
            if let detail = data["detail"] as? String {
                self.detail = detail
            }
        }
    }
    
    var Name : String {
        return self.name
    }
    
    var Email : String {
        return self.email
    }
    
    var Role : String {
        return self.role
    }
    
    var Image : String {
        return self.image
    }
    
    var Detail : String? {
        return self.detail
    }
}
