//
//  forgottenPasswordViewController.swift
//  clunch
//
//  Created by Eléa on 02/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class ForgottenPasswordConfirmationViewController: UIViewController {

    @IBOutlet weak var clunchLabel: UILabel!
    @IBOutlet weak var newPasswordLabel: UILabel!
    @IBOutlet weak var InscrtuctionLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.loginButton.layer.cornerRadius = 5

    }
    @IBAction func loginAction(_ sender: Any) {
        let forgottenPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "PreLoginViewController") as! PreLoginViewController
        self.navigationController?.pushViewController(forgottenPasswordViewController, animated: true)
    }
}
