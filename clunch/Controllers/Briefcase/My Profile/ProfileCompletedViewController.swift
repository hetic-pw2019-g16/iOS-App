//
//  ProfileCompletedViewController.swift
//  clunch
//
//  Created by Eléa on 03/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class ProfileCompletedViewController: UIViewController {

    
    @IBOutlet weak var findEventButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.findEventButton.layer.cornerRadius = 5
    }
    
    @IBAction func findEventAction(_ sender: Any) {
//        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
//        self.navigationController?.pushViewController(nextViewController, animated: true)
    }


}
