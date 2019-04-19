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
    
    // MARK :- Pop Up View
    @IBOutlet weak var clearView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var validateDateButton: UIButton!
    
    @IBOutlet weak var nextStepToStep3Button: UIButton!
    
    var recipe: String = ""
    var recipeDescription: String = ""
    var eventDate: Date = Date()
    var finishDate: Date = Date()
    
    var isOnEventDate:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        self.nextStepToStep3Button.layer.cornerRadius = 5
        self.clearView.isHidden = true
    }

    @IBAction func validateDateAction(_ sender: Any) {
        self.clearView.isHidden = true
        if (self.isOnEventDate){
            self.eventDate = self.datePicker.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            let dateStr = dateFormatter.string(from: self.eventDate)
            self.eventDateButton.setTitle(dateStr, for: .normal)
        }else{
            self.finishDate = self.datePicker.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            let dateStr = dateFormatter.string(from: self.finishDate)
            self.eventLimitDateButton.setTitle(dateStr, for: .normal)  
        }
    }
    
    @IBAction func eventLimitDateButton(_ sender: Any) {
        self.clearView.isHidden = false
        self.isOnEventDate = false
    }
    
    @IBAction func eventHourButton(_ sender: Any) {
    }
    
    @IBAction func eventDateButton(_ sender: Any) {
        self.clearView.isHidden = false
        self.isOnEventDate = true
    }
    
    @IBAction func nextStepToStep3Button(_ sender: Any) {
        let nextStepViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateEventStep3ViewController") as! CreateEventStep3ViewController
        nextStepViewController.recipe = self.recipe
        nextStepViewController.recipeDescription = self.recipeDescription
        nextStepViewController.eventDate = self.eventDate
        nextStepViewController.finishDate = self.finishDate
        self.navigationController?.pushViewController(nextStepViewController, animated: true)
    }
}
