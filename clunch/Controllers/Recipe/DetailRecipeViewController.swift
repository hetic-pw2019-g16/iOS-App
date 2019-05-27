//
//  DetailRecipeViewController.swift
//  clunch
//
//  Created by Samy on 28/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class DetailRecipeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageRecipeDetailView: UIImageView!
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var recipeDescription: UITextView!
    
    var parametre: RecipeItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = parametre.name
        recipeLabel.text = parametre.name
        imageRecipeDetailView.af_setImage(withURL: parametre.image)
        recipeDescription.text = parametre.description
        
        
    }
}
