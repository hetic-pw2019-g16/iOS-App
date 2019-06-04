//
//  UrlBuilder.swift
//  clunch
//
//  Created by Samy on 15/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import Foundation

class UrlBuilder {
    static let errorCode = 400
    static let sucessCode = 200
    
    private static let baseUrl: String = {
        return "http://clunch.maximegrec.com/api"
    }()
    
    static func userCheckUrl() -> String {
        return "\(baseUrl)/user/check"
    }
    
    static func loginUrl() -> String {
        return "\(baseUrl)/login"
    }
    
    static func categoryListUrl() -> String {
        return "\(baseUrl)/categories"
    }
    
    static func categoryItemUrl(id: String) -> String {
        print("\(baseUrl)/categories/" + id + "/recipes")
        return "\(baseUrl)/category/" + id + "/recipes"
    }
    
    static func dateEventsUrl(id: String, date: String) -> String {
        return "\(baseUrl)/company/" +  id + "/date/" + date + "/events"
    }
    
    static func addEventsUrl(id: String) -> String {
        return "\(baseUrl)/user/" + id + "/event/create"
    }
    
    static func getEventsByCompagny(id: String) -> String {
        return "\(baseUrl)/company/" + id + "/events"
    }
    
    // static func deleteEvent(eventId : String, userId: String, state: Bool) -> String {
    //  var 
// }
    
    static func participationToEventUrl(eventId: String, userId: String, state: Bool) -> String {
        var res: String
        
        if state {
            res = "\(baseUrl)/user/" + userId + "/event/" + eventId + "/leave"
        } else {
            res = "\(baseUrl)/user/" + userId + "/event/" + eventId + "/join"
        }
        
        return res
    }
}


