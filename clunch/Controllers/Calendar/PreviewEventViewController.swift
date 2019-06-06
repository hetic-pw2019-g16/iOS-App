//
//  PreviewEventViewController.swift
//  clunch
//
//  Created by Eléa on 25/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class PreviewEventViewController: UIViewController {

    @IBOutlet weak var creatorEventImage: UIImageView!
    @IBOutlet weak var creatorEventLabel: UILabel!
    @IBOutlet weak var mealTitleLabel: UILabel!
    @IBOutlet weak var mealDescriptionLabel: UILabel!
    @IBOutlet weak var validateActionButton: UIButton!
    @IBOutlet weak var nameParticipantsLabel: UILabel!
    @IBOutlet weak var hourEventLabel: UILabel!
    @IBOutlet weak var dateEventLabel: UILabel!
    @IBOutlet weak var viewEventView: UIView!
    @IBOutlet weak var headerEventView: UIView!
    @IBOutlet weak var backView: UIView!
    
    var event : Event?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.headerEventView.setColor(creator: event?.creator ?? false, participant: event?.participating ?? false)
        

        self.validateActionButton.layer.cornerRadius = 5
        self.viewEventView.addShadow(withRadius: true, radius: 7)

        if #available(iOS 11.0, *) {
            self.headerEventView.layer.cornerRadius = 7
            self.headerEventView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            
        } else {
            self.headerEventView.addShadow(withRadius: true, radius: 7)
        }
    
        if (self.event != nil) {
            if (self.event?.user.username == "Samy"){
                self.creatorEventImage.image = UIImage(named: "creator_event2")
            } else if (self.event?.user.username == "Elea"){
                self.creatorEventImage.image = UIImage(named: "creator_event")
            } else {
                self.creatorEventImage.image = UIImage(named: "creator_event3")
            }
            
            self.creatorEventLabel.text = self.event?.user.username
            self.mealTitleLabel.text = self.event?.recipe
            self.mealDescriptionLabel.text = self.event?.description
            var array:[String] = []
            var i = 0
            if (self.event?.participants.count != 0) {
                while (i < (self.event?.participants.count)!){
                    array.append((self.event?.participants[i].username)!)
                    i = i+1
                }
                let allparticipants = array.joined(separator: "  -  ")
                self.nameParticipantsLabel.text = allparticipants
            } else {
                self.nameParticipantsLabel.text = "Pas encore de participants"
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "fr_FR")
            dateFormatter.dateFormat = "EEEE d MMMM"
            let dateStr = dateFormatter.string(from: self.event!.date)
            self.dateEventLabel.text = dateStr.uppercased()
            dateFormatter.dateFormat = "HH:mm"
            let hour = dateFormatter.string(from: self.event!.date)
            self.hourEventLabel.text = hour
            
            
            if self.event?.participating ?? false {
                self.validateActionButton.setTitle("Quitter", for: .normal)
                self.validateActionButton.backgroundColor = UIColor(red: 246/255, green: 105/255, blue: 118/255, alpha: 1)
            }
            
            if self.event?.participants.count ?? 0 >= self.event?.quantity ?? 0 && !self.event!.participating && !self.event!.creator{
                self.validateActionButton.removeFromSuperview()
            }
            
            if self.event?.creator ?? false {
                //self.validateActionButton.removeFromSuperview()
                self.validateActionButton.setTitle("Supprimer", for: .normal)
                self.validateActionButton.backgroundColor = UIColor(red: 246/255, green: 105/255, blue: 118/255, alpha: 1)
            }
            
            if Date() > event?.date ?? Date() {
                self.validateActionButton.removeFromSuperview()
            }
            
            if Date() > event?.limitDate ?? Date() {
                self.validateActionButton.removeFromSuperview()
            }
        }
    }
    
    
    @IBAction func validateButtonAction(_ sender: Any) {
        if (self.event != nil) {
            if (!self.event!.creator) {
                EventService.participationToEventAction(eventId: self.event!.id, userId: UserDefaults.getTheUserStored()!.userId, state: self.event!.participating) { (res, error) in

                    self.navigationController?.popToRootViewController(animated: true)
                }
            } else {
                EventService.deleteEventAction(eventId: self.event!.id) { (res, error) in
                    
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
        }
    }

}
