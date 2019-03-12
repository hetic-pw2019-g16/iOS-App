//
//  DetailRecipeViewController.swift
//  clunch
//
//  Created by Samy on 28/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class DetailRecipeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var recipeLabel: UILabel!
    
    var parametre: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = parametre
        recipeLabel.text = parametre
    }
}
