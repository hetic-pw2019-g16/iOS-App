//
//  MyProfileViewController.swift
//  clunch
//
//  Created by Eléa on 03/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet weak var chooseImageButton: UIButton!
    
    @IBOutlet weak var companyPoleTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var validateProfileButton: UIButton!
    @IBOutlet weak var miniBioLabel: UILabel!
    @IBOutlet weak var addPhotoLabel: UILabel!
    @IBOutlet weak var miniBioTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.hideKeyboardOnTouch()
         self.validateProfileButton.layer.cornerRadius = 5
    }
    
    @IBAction func validateProfilAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileCompletedViewController") as! ProfileCompletedViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
