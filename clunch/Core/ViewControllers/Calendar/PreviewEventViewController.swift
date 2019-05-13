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
    var backview : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch backview {
        case 1:
            self.backView.backgroundColor = UIColor(red:1.00, green:0.76, blue:0.33, alpha:1.0)
            break
        case 2:
            self.backView.backgroundColor = UIColor(red: 89/255, green: 190/255, blue: 176/255, alpha: 1)
             break
        default:
            self.backView.backgroundColor = UIColor(red: 246/255, green: 105/255, blue: 118/255, alpha: 1)
            
        }
        self.validateActionButton.layer.cornerRadius = 5
        self.viewEventView.addShadow(withRadius: true, radius: 7)

        if #available(iOS 11.0, *) {
            self.headerEventView.layer.cornerRadius = 7
            self.headerEventView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            
        } else {
            self.headerEventView.addShadow(withRadius: true, radius: 7)
        }
    
        if (self.event != nil) {
            self.creatorEventLabel.text = self.event?.user.username
            self.mealTitleLabel.text = self.event?.recipe
            self.mealDescriptionLabel.text = self.event?.description
            var array:[String] = []
            var i = 0
            while (i < (self.event?.participants.count)!){
                array.append((self.event?.participants[i].username)!)
                i = i+1
            }
            let allparticipants = array.joined(separator: "  -  ")
            self.nameParticipantsLabel.text = allparticipants
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            let dateStr = dateFormatter.string(from: self.event!.date)
            let gooddate = dateStr.toString(to: 8)
            self.dateEventLabel.text = gooddate
            
            if self.event?.participating ?? false {
                self.validateActionButton.setTitle("Quitter", for: .normal)
                self.validateActionButton.backgroundColor = UIColor(red: 246/255, green: 105/255, blue: 118/255, alpha: 1)
            }
            
            if self.event?.creator ?? false {
                self.validateActionButton.removeFromSuperview()
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
            }
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
