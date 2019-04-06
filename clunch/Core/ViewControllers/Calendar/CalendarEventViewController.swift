//
//  CalendarEventViewController.swift
//  clunch
//
//  Created by Samy on 31/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class CalendarEventViewController: UIViewController {

    @IBOutlet weak var popUp: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var date: Date!
    let detailEventIdentifier = "detail_event_identifier"

    lazy var events = [Event]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        dateLabel.text = dateFormatterPrint.string(from: date)

        popUp.popUp()
        
        // TODO Current Day + User related events
        events.append(Event(title: "Vincent", commentaries: [], meal: "Pâtes sauce orange"))
        events.append(Event(title: "Nicolas", commentaries: [], meal: "Pâtes Carbonara"))
        events.append(Event(title: "Laurette", commentaries: [], meal: "Pâtes bolognaise"))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueIdentifier = segue.identifier {
            if segueIdentifier==detailEventIdentifier {
                if let eventCell = sender as? EventItemTableViewCell, let destinationViewController = segue.destination as? CalendarEventItemViewController {
                    destinationViewController.name = eventCell.item.title
                }
            }
        }
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CalendarEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EventItemTableViewCell.identifier, for: indexPath) as! EventItemTableViewCell
        
        cell.item = events[indexPath.row]
        
        return cell
    }
}
