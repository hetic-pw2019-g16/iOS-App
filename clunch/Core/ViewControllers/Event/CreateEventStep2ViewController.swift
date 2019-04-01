//
//  CreateEventStep2ViewController.swift
//  clunch
//
//  Created by Macintosh on 14/03/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class CreateEventStep2ViewController: UIViewController {

    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventDateButton: UIButton!
    @IBOutlet weak var eventHourLabel: UILabel!
    @IBOutlet weak var eventHourButton: UIButton!
    @IBOutlet weak var eventLimitDateLabel: UILabel!
    @IBOutlet weak var eventLimitDateButton: UIButton!
    @IBOutlet weak var eventConsignDateLabel: UILabel!
    
    @IBOutlet weak var nextStepToStep3Button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        self.nextStepToStep3Button.buttonStyle(color: UIButton.green)
        self.nextStepToStep3Button.layer.cornerRadius = 5
    }

    @IBAction func eventLimitDateButton(_ sender: Any) {
    }
    @IBAction func eventHourButton(_ sender: Any) {
    }
    @IBAction func eventDateButton(_ sender: Any) {
    }
    @IBAction func nextStepToStep3Button(_ sender: Any) {
        let nextStepViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateEventStep3ViewController") as! CreateEventStep3ViewController
        self.navigationController?.pushViewController(nextStepViewController, animated: true)
    }
}
