//
//  RecipeItemTableViewCell.swift
//  clunch
//
//  Created by Samy on 29/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class RecipeItemTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageRecipeView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier = "recipe_cell_identifier"
    
    var item: RecipeItem! {
        didSet {
            nameLabel.text = item.name
            imageRecipeView.af_setImage(withURL: item.image)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageRecipeView.alpha = 0.6
        
    }

}
