//
//  CalendarEventItemViewController.swift
//  clunch
//
//  Created by Samy on 31/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class CalendarEventItemViewController: UIViewController {

    @IBOutlet weak var eventName: UILabel!
    
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = name
        eventName.text = name
    }
}
