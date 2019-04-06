//
//  CalendarViewController.swift
//  clunch
//
//  Created by Samy on 27/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: JTAppleCalendarView!
    
    let green = UIColor(red:0.35, green:0.75, blue:0.69, alpha:1.0)
    let grey = UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0)
    let greyInactive = UIColor(red:0.50, green:0.50, blue:0.50, alpha:0.25)

    // TODO SET View in Main story board
    let viewEvent: UIView = UIView(frame: CGRect(x: 2, y: 0, width: 30, height: 30))
    
    let formatter = DateFormatter()
    
    lazy var events = [Event]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Calendrier"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.collectionView.calendarDataSource = self
        self.collectionView.calendarDelegate = self
        
        // TODO Current User related events
        events.append(Event(title: "Vincent", meal: "hbjhsbx"))
        events.append(Event(title: "Nicolas", meal: "jhdbzljjhn"))
        events.append(Event(title: "Laurette", meal: "bdehjzs;vbz"))
    }
    
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState, date: Date! = nil) {
        guard let cell = view as? CalendarItemCell else { return }
        
        if cellState.isSelected {
            cell.cellDay.textColor = .white
            if date != nil {
                showPopUp(date: date)
            }
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                cell.cellDay.textColor = grey
            } else {
                cell.cellDay.textColor = greyInactive
            }
        }
    }
    
    func showPopUp(date: Date) {
        let popUp = UIStoryboard(name: "Calendar", bundle: nil).instantiateViewController(withIdentifier: "eventPopUp") as! CalendarEventViewController

        popUp.date = date
        let popUpNav = UINavigationController(rootViewController: popUp)
        self.present(popUpNav, animated: true, completion: nil)
    }
}


extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return events.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuDayCell = self.tableView.dequeueReusableCell(withIdentifier: "menuDayCell", for: indexPath)
        
        let event = events[indexPath.row]
        
        menuDayCell.textLabel?.text = event.title
        
        return menuDayCell
    }
    
}

extension CalendarViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextColor(view: cell, cellState: cellState, date: date)

        self.viewEvent.isHidden = false
        
        self.viewEvent.backgroundColor = green
        self.viewEvent.layer.cornerRadius = 5
        self.viewEvent.layer.zPosition = -1
        
        cell?.addSubview(self.viewEvent)
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextColor(view: cell, cellState: cellState)
        self.viewEvent.isHidden = true
    }
    
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
        return
    }
    
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let myCustomCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarItemCell
        
        self.calendar(calendar, willDisplay: myCustomCell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        myCustomCell.cellDay.text = cellState.text
        
        handleCellTextColor(view: myCustomCell, cellState: cellState, date: date)
        
        return myCustomCell
    }
}



