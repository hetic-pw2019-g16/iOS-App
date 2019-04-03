//
//  ProfileCompletedViewController.swift
//  clunch
//
//  Created by Macintosh on 03/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class ProfileCompletedViewController: UIViewController {

    
    @IBOutlet weak var findEventButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.findEventButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func findEventAction(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
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
