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
        // lorsque item sera assigné
        // alors le code du block didSet sera executé
        didSet {
            // Refresh UI
            nameLabel.text = item.name
            imageRecipeView.af_setImage(withURL: item.image)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
