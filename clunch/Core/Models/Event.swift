//
//  Event.swift
//  clunch
//
//  Created by Eléa on 30/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import Foundation

class Event {
    var id: Int!
    var recipe: String!
    var description: String!
    var date: Date = Date()
    var user: User
    var quantity: Int!
    var participants: [User]
    var commentaries:[String]
    var participating: Bool
    var creator: Bool
    
    init(id: Int = 0, recipe: String, description: String, date: Date, user: User, quantity: Int, participants: [User] = [], commentaries:[String] = []) {
        self.id = id
        self.recipe = recipe
        self.description = description
        self.date = date
        self.user = user
        self.quantity = quantity
        self.participants = participants
        self.commentaries = commentaries
        self.creator = UserDefaults.getTheUserStored()?.userId == user.userId ? true : false
        self.participating = participants.contains(where: { $0.userId == UserDefaults.getTheUserStored()?.userId })
    }
}
