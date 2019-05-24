//
//  PreLoginViewController.swift
//  clunch
//
//  Created by Eléa on 02/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PreLoginViewController: UIViewController {
    
    
    @IBOutlet weak var clunchLabel: UILabel!
    @IBOutlet weak var connectLabel: UILabel!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var youDontHaveAccountYetButton: UIButton!
    @IBOutlet weak var nextStepToPasswordScreenButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.hideKeyboardOnTouch()
        self.nextStepToPasswordScreenButton.layer.cornerRadius = 5
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    @IBAction func youDontHaveAccountYetAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "DontHaveAccountYetViewController") as! DontHaveAccountYetViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func nextStepToPassworScreenButton(_ sender: Any) {
        
        let body = ["email": emailAddressTextField.text]
        AuthService.userCheckAction(body: body as [String : Any]) { (res, error) in
            let code = res["code"].int
            
            if code == UrlBuilder.errorCode {
                let title = "Erreur"
                let message = "Not Found"
                let button = "Close"
                
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: button, style: UIAlertAction.Style.cancel, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            } else {
                let nextStepViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                nextStepViewController.email = self.emailAddressTextField.text ?? ""
                self.navigationController?.pushViewController(nextStepViewController, animated: true)
            }
        }
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
