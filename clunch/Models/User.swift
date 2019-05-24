//
//  User.swift
//  clunch
//
//  Created by Eléa on 10/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    let userId : Int
    let username : String
    let email : String
    let token : String
    let companyId : Int
    
    //userId : Int = -1
    init(userId : Int = 0, username : String = "", email : String = "", token : String = "", companyId : Int = 0) {
        self.token = token
        self.userId = userId
        self.username = username
        self.email = email
        self.companyId = companyId
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(userId, forKey : "userId")
        aCoder.encode(username, forKey : "username")
        aCoder.encode(email, forKey : "email")
        aCoder.encode(token, forKey : "token")
        aCoder.encode(companyId, forKey : "companyId")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.userId = aDecoder.decodeInteger(forKey: "userId")
        self.username = aDecoder.decodeObject(forKey: "username") as! String
        self.email = aDecoder.decodeObject(forKey: "email") as! String
        self.token = aDecoder.decodeObject(forKey: "token") as! String
        self.companyId = aDecoder.decodeInteger(forKey: "companyId")
    }
}
