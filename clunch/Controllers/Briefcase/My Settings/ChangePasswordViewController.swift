//
//  ChangePasswordViewController.swift
//  clunch
//
//  Created by Eléa on 04/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var oldPassxordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.hideKeyboardOnTouch()
    }
    

    @IBAction func confirmNewPasswordAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "PasswordChangedViewController") as! PasswordChangedViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)

    }
}
