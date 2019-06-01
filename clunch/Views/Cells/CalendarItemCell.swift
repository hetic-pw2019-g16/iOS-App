//
//  CalendarItemCell.swift
//  clunch
//
//  Created by Eléa on 30/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarItemCell: JTAppleCell {

    @IBOutlet var cellDay: UILabel!
    @IBOutlet weak var bulletPointView: UIView!
    
    var event: Event?
}
