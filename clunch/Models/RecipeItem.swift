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
    var description: String
    var ingredients: String
    var image: URL
    
    init(name: String, category: CategoryItem, description: String, ingredients: String, image: URL) {
        self.name = name
        self.category = category
        self.description = description
        self.ingredients = ingredients
        self.image = image
    }
}
