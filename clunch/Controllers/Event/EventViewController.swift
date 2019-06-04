//
//  EventViewController.swift
//  clunch
//
//  Created by Samy on 27/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit
import EventKit
import EventKitUI

class EventViewController: UIViewController {
    
    @IBOutlet weak var eventView: UIView!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var buttonCreateNewEvent: UIButton!
    @IBOutlet weak var createNewEventLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.hideKeyboardOnTouch()
    }
    @IBAction func buttonCreateEvent(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateEventStep1ViewController") as! CreateEventStep1ViewController
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
 
