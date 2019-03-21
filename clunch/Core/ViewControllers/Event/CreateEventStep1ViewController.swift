//
//  CreateEventStep1ViewController.swift
//  clunch
//
//  Created by Macintosh on 14/03/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class CreateEventStep1ViewController: UIViewController {

    @IBOutlet var createEventStep1View: UIView!
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var RecipeNameTextField: UITextField!
    @IBOutlet weak var buttonFindRecipe: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageCreateEventStep1: UIImageView!
    @IBOutlet weak var buttonNextStep: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonFindRecipe.buttonStyle(color: UIButton.green)
        self.buttonNextStep.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
