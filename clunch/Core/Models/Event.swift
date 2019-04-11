//
//  Event.swift
//  clunch
//
//  Created by Samy on 30/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import Foundation

class Event {
    var title: String!
    var commentaries:[String]
    var meal: String!
    
    init(title: String, commentaries:[String] = [], meal: String) {
        self.title = title
        self.commentaries = commentaries
        self.meal = meal
    }
}
