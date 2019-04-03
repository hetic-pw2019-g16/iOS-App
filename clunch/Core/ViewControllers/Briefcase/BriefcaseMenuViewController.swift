//
//  BriefcaseMenuViewController.swift
//  clunch
//
//  Created by Macintosh on 03/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class BriefcaseMenuViewController: UIViewController {

    @IBOutlet weak var myProfileButton: UIButton!
    @IBOutlet weak var myRulesButton: UIButton!
    @IBOutlet weak var mySettingsButton: UIButton!
    @IBOutlet weak var seeMoreAboutUtilisationCondition: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func myProfilAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MyProfileViewController") as! MyProfileViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

    @IBAction func myRulesAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MyRulesViewController") as! MyRulesViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func mySettingsAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MySettingsViewController") as! MySettingsViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func seeMoreAboutUtilisationConditionAction(_ sender: Any) {
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
