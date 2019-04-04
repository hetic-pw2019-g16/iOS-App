//
//  RecipeViewController.swift
//  clunch
//
//  Created by Samy on 27/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let detailRecipeIdentifier = "list_recipe_identifier"
    
    lazy var categories = [CategoryItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Table Style
        tableView.categotyStyle()
        // Cell Style
        
        self.title = "Recette"
        
        // TODO: API Call for all categories
        categories.append(CategoryItem(name: "Healthy"))
        categories.append(CategoryItem(name: "Viande"))
        categories.append(CategoryItem(name: "Italien"))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueIdentifier = segue.identifier {
            if segueIdentifier==detailRecipeIdentifier {
                if let recipeCell = sender as? CategoryItemTableViewCell, let destinationViewController = segue.destination as? RecipeViewController {
                    destinationViewController.category = recipeCell.item
                }
            }
        }
    }
}


extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryItemTableViewCell.identifier, for: indexPath) as! CategoryItemTableViewCell
        
        cell.item = categories[indexPath.row]
        
        return cell
    }
}
