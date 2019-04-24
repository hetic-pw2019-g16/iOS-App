//
//  CreateEventStep3ViewController.swift
//  clunch
//
//  Created by Eléa on 01/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class CreateEventStep3ViewController: UIViewController {

    
    @IBOutlet weak var nextStepToRecapScreenButton: UIButton!
    @IBOutlet weak var nomberOfParticipantsLabel: UILabel!
    @IBOutlet weak var addColleagueButton: UIButton!
    @IBOutlet weak var invitColleagueLabel: UILabel!
   
    var recipe: String = ""
    var recipeDescription: String = ""
    var finishDate: Date = Date()
    var eventDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.nextStepToRecapScreenButton.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addColleagueButton(_ sender: Any) {

    }
    @IBAction func nextStepToRecapScreenButton(_ sender: Any) {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy"
        
        let date = dateFormatterPrint.string(from: eventDate)

        let body = ["recipe": recipe, "date": date, "desc": recipeDescription, "quantity": 2] as [String : Any]
        let id = UserDefaults.getTheUserStored()!.userId as Int
        
        EventService.addEventAction(id: id, body: body) { (res, error) in
            print("hello")
            print(res)
        }
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
