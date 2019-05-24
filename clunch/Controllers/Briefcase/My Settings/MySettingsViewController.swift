//
//  MySettingsViewController.swift
//  clunch
//
//  Created by Eléa on 03/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class MySettingsViewController: UIViewController {

    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var contactUSButton: UIButton!
    @IBOutlet weak var receiveNotificationSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changePasswordAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

    @IBAction func contactUSAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
    @IBAction func receiveNotificationAction(_ sender: Any) {
        
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
