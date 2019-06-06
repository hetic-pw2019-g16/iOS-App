//
//  CreateEventStep1ViewController.swift
//  clunch
//
//  Created by Eléa on 14/03/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class CreateEventStep1ViewController: UIViewController {

    @IBOutlet var createEventStep1View: UIView!
    @IBOutlet weak var RecipeNameTextField: UITextField!
    @IBOutlet weak var buttonFindRecipe: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageCreateEventStep1: UIImageView!
    @IBOutlet weak var buttonNextStep: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonFindRecipe.buttonStyle(color: UIButton.green)
        self.buttonNextStep.layer.cornerRadius = 5
        self.view.hideKeyboardOnTouch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.RecipeNameTextField.text = ""
        self.descriptionTextView.text = ""
    }
    
    @IBAction func nextStepToStep2Button(_ sender: Any) {
        if (self.RecipeNameTextField.text != "" && self.descriptionTextView.text != "") {
            let nextStepViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateEventStep2ViewController") as! CreateEventStep2ViewController
            nextStepViewController.recipe = self.RecipeNameTextField.text ?? ""
            nextStepViewController.recipeDescription = self.descriptionTextView.text ?? ""
            
            self.navigationController?.pushViewController(nextStepViewController, animated: true)
        }
    }
    
    @IBAction func findRecipesButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Recipe", bundle: nil).instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        self.navigationController?.pushViewController(vc, animated: true)
        }
}
