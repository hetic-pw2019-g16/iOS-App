//
//  User.swift
//  clunch
//
//  Created by Macintosh on 10/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    let userId : String
    let username : String
    let email : String
    let password : String
    
    //userId : Int = -1
    init(userId : String = "", username : String = "", email : String = "", password : String = "") {
        self.password = password
        self.userId = userId
        self.username = username
        self.email = email
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(userId, forKey : "userId")
        aCoder.encode(username, forKey : "username")
        aCoder.encode(email, forKey : "email")
        aCoder.encode(password, forKey : "password")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.userId = aDecoder.decodeObject(forKey: "userId") as! String
        self.username = aDecoder.decodeObject(forKey: "username") as! String
        self.email = aDecoder.decodeObject(forKey: "email") as! String
        self.password = aDecoder.decodeObject(forKey: "password") as! String

    }
}
