//
//  File.swift
//  clunch
//
//  Created by Samy on 29/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import Foundation

class RecipeItem {
    var name: String
    var category: CategoryItem
    
    init(name: String, category: CategoryItem) {
        self.name = name
        self.category = category
    }
}
