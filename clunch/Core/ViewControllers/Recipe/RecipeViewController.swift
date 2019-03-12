//
//  RecipeViewController.swift
//  clunch
//
//  Created by Samy on 29/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let detailRecipeIdentifier = "detail_recipe_identifier"
    var category: CategoryItem!

    lazy var recipes = [RecipeItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = category.name
        
        // TODO API Call get Recipe By category
        recipes.append(RecipeItem(name: "Pizza", category: category))
        recipes.append(RecipeItem(name: "Lasagnes Végétarienne", category: category))
        recipes.append(RecipeItem(name: "Pattes", category: category))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueIdentifier = segue.identifier {
            if segueIdentifier==detailRecipeIdentifier {
                if let recipeCell = sender as? RecipeItemTableViewCell, let destinationViewController = segue.destination as? DetailRecipeViewController {
                    destinationViewController.parametre = recipeCell.item.name
                }
            }
        }
    }
}

extension RecipeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeItemTableViewCell.identifier, for: indexPath) as! RecipeItemTableViewCell
        
        cell.item = recipes[indexPath.row]
        
        return cell
    }
}
