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
        
        RecipeService.getCategoryListAction() { (res, error) in
            self.categories.removeAll()
            
            
            for category in res {
                self.categories.append(CategoryItem(name: category["name"] as! String, id: category["id"] as! Int))
            }

            
            self.tableView.reloadData()
        }
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
