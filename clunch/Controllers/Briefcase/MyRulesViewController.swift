//
//  MyRulesViewController.swift
//  clunch
//
//  Created by Eléa on 03/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class MyRulesViewController: UIViewController {

    @IBOutlet weak var hygieneCharterButton: UIButton!
    @IBOutlet weak var goodPracticesButton: UIButton!
    @IBOutlet weak var contactUsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func hygieneCharterAction(_ sender: Any) {
    }
    @IBAction func goodPracticesAction(_ sender: Any) {
    }
    
    @IBAction func contactUsAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
