//
//  MyRulesViewController.swift
//  clunch
//
//  Created by Macintosh on 03/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class MyRulesViewController: UIViewController {

    @IBOutlet weak var hygieneCharterButton: UIButton!
    @IBOutlet weak var goodPracticesButton: UIButton!
    @IBOutlet weak var contactUsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func hygieneCharterAction(_ sender: Any) {
    }
    @IBAction func goodPracticesAction(_ sender: Any) {
    }
    
    @IBAction func contactUsAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
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
