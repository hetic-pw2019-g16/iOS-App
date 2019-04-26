//
//  RegisteredEventsViewController.swift
//  clunch
//
//  Created by Eléa on 07/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class RegisteredEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var registeredEventsTableView: UITableView!
    
    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.registeredEventsTableView.delegate = self
        self.registeredEventsTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComingEventsTableViewCell", for: indexPath) as! ComingEventsTableViewCell
        cell.backView.backgroundColor = UIColor(red:1.00, green:0.76, blue:0.33, alpha:1.0)
        
        let tmpEvent = self.events[indexPath.row]
        cell.eventCreator.text = tmpEvent.user.username
        cell.mealTitle.text = tmpEvent.recipe
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let dateStr = dateFormatter.string(from: self.events[indexPath.row].date)
        let gooddate = dateStr.toString(to: 8)
        cell.dateTitle.text = gooddate
        cell.inscriptionNumber.text = String(format: "%d participants", tmpEvent.participants.count)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.registeredEventsTableView.deselectRow(at: indexPath, animated: false)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PreviewEventViewController") as! PreviewEventViewController
        vc.event = self.events[indexPath.row]
        vc.backview = 1
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension RegisteredEventsViewController {
    func refreshEvents (allEvents:[Event]){
        self.events = allEvents
        self.registeredEventsTableView.reloadData()
    }
}
