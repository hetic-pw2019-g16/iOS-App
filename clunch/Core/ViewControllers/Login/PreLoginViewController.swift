//
//  PreLoginViewController.swift
//  clunch
//
//  Created by Macintosh on 02/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class PreLoginViewController: UIViewController {
    
    
    @IBOutlet weak var clunchLabel: UILabel!
    @IBOutlet weak var connectLabel: UILabel!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var youDontHaveAccountYetButton: UIButton!
    @IBOutlet weak var nextStepToPasswordScreenButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    @IBAction func youDontHaveAccountYetAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "DontHaveAccountYetViewController") as! DontHaveAccountYetViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func nextStepToPassworScreenButton(_ sender: Any) {
        let nextStepViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(nextStepViewController, animated: true)
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
