//
//  ForgottenPasswordViewController.swift
//  clunch
//
//  Created by Macintosh on 03/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class ForgottenPasswordViewController: UIViewController {
    
    @IBOutlet weak var clunchLabel: UILabel!
    @IBOutlet weak var forgottenPasswordLabel: UILabel!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var forgottenPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.forgottenPasswordButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgottenPasswordAction(_ sender: Any) {
        let forgottenPasswordConfirmationViewController = self.storyboard?.instantiateViewController(withIdentifier: "ForgottenPasswordConfirmationViewController") as! ForgottenPasswordConfirmationViewController
        self.navigationController?.pushViewController(forgottenPasswordConfirmationViewController, animated: true)
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
