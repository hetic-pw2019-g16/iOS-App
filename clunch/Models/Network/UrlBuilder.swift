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
        return "\(baseUrl)/users/checks"
    }
    
    static func loginUrl() -> String {
        return "\(baseUrl)/login"
    }
    
    static func categoryListUrl() -> String {
        return "\(baseUrl)/categories"
    }
    
    static func categoryItemUrl(id: String) -> String {
        print("\(baseUrl)/categories/" + id + "/recipes")
        return "\(baseUrl)/categories/" + id + "/recipes"
    }
    
    static func dateEventsUrl(id: String, date: String) -> String {
        return "\(baseUrl)/events/" + id + "/companies/" + date + "/date"
    }
    
    static func addEventsUrl(id: String) -> String {
        return "\(baseUrl)/events/" + id + "/creates"
    }
    
    static func getEventsByCompagny(id: String) -> String {
        return "\(baseUrl)/events/" + id + "/company"
    }
    
    static func participationToEventUrl(eventId: String, userId: String, state: Bool) -> String {
        var res: String
        
        if state {
            res = "\(baseUrl)/events/" + eventId + "/users/" + userId + "/leaves"
        } else {
            res = "\(baseUrl)/events/" + eventId + "/users/" + userId + "/joins"
        }
        
        return res
    }
}


