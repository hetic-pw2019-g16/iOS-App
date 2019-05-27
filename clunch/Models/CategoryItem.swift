//
//  CategoryItem.swift
//  clunch
//
//  Created by Samy on 28/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import Foundation

class CategoryItem {
    var name: String
    var id: Int
    var image: URL
    
    init(name: String, id: Int, image: URL) {
        self.name = name
        self.id = id
        self.image = image
    }
}
