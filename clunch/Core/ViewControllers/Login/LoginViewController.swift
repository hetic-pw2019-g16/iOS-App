//
//  LoginViewController.swift
//  clunch
//
//  Created by Samy on 27/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var forgottenPasswordButton: UIButton!
    @IBOutlet weak var connectToAnotherAccountButton: UIButton!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var clunchLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    let navigationHomeIdentifier = "navigation_home_identifier"
    var email: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loginButton.layer.cornerRadius = 5
        //passwordTextField.loginTextStyleNear(color: UITextField.greyclear)
        
    }
    
    

    
    @IBAction func connectToAnotherAccountAction(_ sender: Any) {
             self.navigationController?.popViewController(animated: true)
    }
    @IBAction func forgottenPasswordAction(_ sender: Any) {
        let forgottenPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "ForgottenPasswordViewController") as! ForgottenPasswordViewController
        self.navigationController?.pushViewController(forgottenPasswordViewController, animated: true)
    }
    @IBAction func loginAction(_ sender: Any) {
        
        // TODO: Verifier les values des champs
        //      Case 1: True
        //          TODO: Faire l'appel Api avec un retour
        //              Case 1: True
        //                  TODO: Changement d'écran Avec Animation
        //              Case 2: False
        //                  Throw Error Message Bad Credidentials
        //      Case 2: False
        //          Throw Error Empty Fields
        
        let params = ["email": email,"password": passwordTextField.text!]
        AuthService.loginAction(body: params) { (res, error) in
            
            UserDefaults.saveThisUser(user: res as! User)
            
            let navigationController = UIStoryboard(name: "Content", bundle: nil).instantiateViewController(withIdentifier: self.navigationHomeIdentifier) as! UITabBarController
            self.navigationController?.pushViewController(navigationController, animated: true)
        }
    }
}
