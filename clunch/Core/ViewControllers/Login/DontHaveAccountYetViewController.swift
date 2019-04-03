//
//  DontHaveAccountYetViewController.swift
//  clunch
//
//  Created by Macintosh on 02/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class DontHaveAccountYetViewController: UIViewController {

    @IBOutlet weak var clunchLabel: UILabel!
    @IBOutlet weak var backToConnexionScreenButton: UIButton!
    @IBOutlet weak var instructionNAYLabel: UILabel!
    @IBOutlet weak var notAccountYetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.backToConnexionScreenButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToConnexionScreenAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
