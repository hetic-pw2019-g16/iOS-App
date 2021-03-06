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
    @IBOutlet weak var sliderParticipantsNumber: UISlider!
    @IBOutlet weak var participantNumberLabel: UILabel!
    
    var recipe: String = ""
    var recipeDescription: String = ""
    var finishDate: Date = Date()
    var eventDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.nextStepToRecapScreenButton.layer.cornerRadius = 5

    }
    
    @IBAction func sliderValueChange(_ sender: Any) {
        self.participantNumberLabel.text = String(format: "%.f", self.sliderParticipantsNumber.value)
    }
    
    @IBAction func nextStepToRecapScreenButton(_ sender: Any) {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy HH:mm"
        
        let date = dateFormatterPrint.string(from: eventDate)
        let limitDate = dateFormatterPrint.string(from: finishDate)
        let number = Int(sliderParticipantsNumber.value)

        let body = ["recipe": recipe, "date": date, "desc": recipeDescription, "quantity": number, "limitDate": limitDate] as [String : Any]
        let id = UserDefaults.getTheUserStored()!.userId as Int
        
        EventService.addEventAction(id: id, body: body) { (res, error) in
            print(res)
            let alert = UIAlertController(title: "Création", message: "Votre événement a bien été créé", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in  self.navigationController?.popToRootViewController(animated: true)}))
            
            self.present(alert, animated: true)
        }
    }
}
