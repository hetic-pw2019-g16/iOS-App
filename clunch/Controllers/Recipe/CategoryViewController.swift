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
        self.tableView.delegate = self
        // Cell Style
        
        
        RecipeService.getCategoryListAction() { (res, error) in
            self.categories.removeAll()
            
            for category in res {
                let errorManagementImage = "https://avatars0.githubusercontent.com/u/44369575?s=460&v=4"
                self.categories.append(CategoryItem(name: category["name"] as? String ?? "pas de nom de catégories",
                                                    id: category["id"] as? Int ?? 0,
                                                    image: URL(string: category["image"] as? String ?? errorManagementImage)!))
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


extension CategoryViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                self.tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryItemTableViewCell.identifier, for: indexPath) as! CategoryItemTableViewCell
        
        cell.item = categories[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 111
    
    }
}
