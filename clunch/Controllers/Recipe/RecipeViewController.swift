//
//  RecipeViewController.swift
//  clunch
//
//  Created by Samy on 29/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    let detailRecipeIdentifier = "detail_recipe_identifier"
    var category: CategoryItem!

    lazy var recipes = [RecipeItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = category.name
        self.tableView.delegate = self
        
        
        RecipeService.getCategoryItemAction(id: category.id) { (res, error) in
            self.recipes.removeAll()
            
            
            for recipe in res {
                let errorManagementImage = "https://avatars0.githubusercontent.com/u/44369575?s=460&v=4"
                let errorManagementDescription = "Pas de description"
                self.recipes.append(RecipeItem(name: recipe["title"] as? String ?? "pas de titre pour la recette", category: self.category,
                                               description: recipe["body"] as? String ?? errorManagementDescription,
                                               ingredients: recipe["ingredients"] as? String ?? "pas d'ingredients oups",
                                              image: URL(string: recipe["image"] as? String ?? errorManagementImage)!))
            }
            
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueIdentifier = segue.identifier {
            if segueIdentifier==detailRecipeIdentifier {
                if let recipeCell = sender as? RecipeItemTableViewCell, let destinationViewController = segue.destination as? DetailRecipeViewController {
                    destinationViewController.parametre = recipeCell.item
                    
                }
            }
        }
    }
}

extension RecipeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeItemTableViewCell.identifier, for: indexPath) as! RecipeItemTableViewCell
        
        cell.item = recipes[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 111
        
    }
}
