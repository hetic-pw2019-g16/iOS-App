//
//  UrlBuilder.swift
//  clunch
//
//  Created by Samy on 15/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import Foundation

class UrlBuilder {
    private static let baseUrl: String = {
        return "http://clunch.maximegrec.com/api"
    }()
    
    static func userCheckUrl() -> String {
        return "\(baseUrl)/users/checks"
    }
    
    static func loginUrl() -> String {
        return "\(baseUrl)/login_check"
    }
    
    static func categoryListUrl() -> String {
        return "\(baseUrl)/categories"
    }
    
    static func categoryItemUrl(id: String) -> String {
        return "\(baseUrl)/categories/" + id + "/recipes"
    }
}
