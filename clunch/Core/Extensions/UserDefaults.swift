//
//  UserDefaults.swift
//  clunch
//
//  Created by Macintosh on 11/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import Foundation

extension UserDefaults {
    static func saveThisUser(user: User) {
        
        let data: Data = NSKeyedArchiver.archivedData(withRootObject: user)
        UserDefaults.standard.set(data, forKey: "clunch_user")
        
    }
    
    static func getTheUserStored() -> User? {
        let userData = UserDefaults.standard.data(forKey: "clunch_user")
        if (userData == nil) {
            return nil
        }
        else {
            let userFound:User? = NSKeyedUnarchiver.unarchiveObject(with: userData!) as? User
            return userFound
        }
    }
}


