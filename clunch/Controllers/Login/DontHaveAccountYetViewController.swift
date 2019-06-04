//
//  DontHaveAccountYetViewController.swift
//  clunch
//
//  Created by Eléa on 02/04/2019.
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

    }
    
    @IBAction func backToConnexionScreenAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
