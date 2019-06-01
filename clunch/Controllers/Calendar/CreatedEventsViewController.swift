//
//  CreatedEventsViewController.swift
//  clunch
//
//  Created by Eléa on 07/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class CreatedEventsViewController: UIViewController,
    UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var createdEventsTableView: UITableView!

    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    self.createdEventsTableView.delegate = self
    self.createdEventsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComingEventsTableViewCell", for: indexPath) as! ComingEventsTableViewCell
        
        let tmpEvent = self.events[indexPath.row]
        cell.eventCreator.text = tmpEvent.user.username
        cell.mealTitle.text = tmpEvent.recipe
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        dateFormatter.locale = Locale(identifier: "fr_FR")
        let dateStr = dateFormatter.string(from: self.events[indexPath.row].date)
        let gooddate = dateStr.toString(to: 8)
        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateFormatter.dateFormat = "MMM"
        let month = dateFormatter.string(from: self.events[indexPath.row].date).uppercased()
        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateFormatter.dateFormat = "HH:mm"
        let hour = dateFormatter.string(from: self.events[indexPath.row].date)
        cell.dateTitle.text = gooddate
        cell.monthLabel.text = month
        cell.hourLabel.text = hour
        if (tmpEvent.user.username == "Samy"){
            cell.profileImage.image = UIImage(named: "creator_event2")
        } else if (tmpEvent.user.username == "Elea"){
            cell.profileImage.image = UIImage(named: "creator_event")
        } else {
            cell.profileImage.image = UIImage(named: "creator_event3")
        }
        cell.inscriptionNumber.text = String(format: "%d participants", tmpEvent.participants.count)


        cell.backView.backgroundColor = UIColor(red: 246/255, green: 105/255, blue: 118/255, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.createdEventsTableView.deselectRow(at: indexPath, animated: false)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PreviewEventViewController") as! PreviewEventViewController
        vc.event = self.events[indexPath.row]
        let nav = self.navigationController
        nav?.pushViewController(vc, animated: true)
        
    }
    
}

extension CreatedEventsViewController {
    func refreshEvents (allEvents:[Event]){
        self.events = allEvents
        self.createdEventsTableView.reloadData()
    }
}
