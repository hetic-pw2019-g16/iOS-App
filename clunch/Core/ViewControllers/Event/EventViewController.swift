//
//  EventViewController.swift
//  clunch
//
//  Created by Samy on 27/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit
import EventKit
import EventKitUI

class EventViewController: UIViewController {
    
    @IBOutlet weak var eventView: UIView!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var buttonCreateNewEvent: UIButton!
    @IBOutlet weak var createNewEventLabel: UILabel!
    /*
//    var eventStore:EKEventStore!
    var calendarArray:[EKCalendar]!
    var allEvents:[EKEvent] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        eventStore = EKEventStore.init()

        eventStore.requestAccess(to: .event, completion: {
            (granted, error) in

            if granted {
                print("granted \(granted)")
            }else {
                print("error \(String(describing: error))")
            }
        })
        
        self.fetchEvents()
    }
    
    
    func fetchEvents(){
        // Date
        let now = Date()
        let calendar = Calendar.current
        var dateComponents = DateComponents.init()
        dateComponents.day = 60 // how many
        let date2daysFromNow = calendar.date(byAdding: dateComponents, to: now)
        
        // Calendars
        self.calendarArray = self.eventStore.calendars(for: .event)
        
        
        for calendar in self.calendarArray {
            
            
            let eventsPredicate = self.eventStore.predicateForEvents(withStart: now, end: date2daysFromNow!, calendars: [calendar])
            
            let events = self.eventStore.events(matching: eventsPredicate)
            
            print("calendar: \(calendar.title)")
            
            for event in events{
                
                print("event: \(String(describing: event.title))")
                // add at when you looping the events
                allEvents.append(event)
            }
        }
    }

    func createEvent(){
        
        let event:EKEvent = EKEvent(eventStore: self.eventStore)
        
        let ok:String = "Test Title"
        
        event.title = ok
        event.startDate = Date()
        event.endDate = Date()
        event.notes = "This is a note"
        event.calendar = self.eventStore.defaultCalendarForNewEvents
        
        let recurrenceRule = EKRecurrenceRule.init(recurrenceWith: .daily,
                                                   interval: 1,
                                                   daysOfTheWeek:[EKRecurrenceDayOfWeek.init(EKWeekday.sunday)],
                                                   daysOfTheMonth: nil,
                                                   monthsOfTheYear: nil,
                                                   weeksOfTheYear: nil,
                                                   daysOfTheYear: nil,
                                                   setPositions: nil,
                                                   end: EKRecurrenceEnd.init(occurrenceCount: 10))
        
        event.recurrenceRules = [recurrenceRule]
        
        try! self.eventStore.save(event, span: EKSpan.thisEvent)
        
    }

    @IBAction func showEddit(_ sender: Any) {
        let eventVC = EKEventEditViewController.init()
        eventVC.event = allEvents.last
        eventVC.editViewDelegate = self
        
        present(eventVC, animated: true, completion: nil)
        
    }
    
    @IBAction func show(_ sender: Any) {
        let eventVC = EKEventViewController.init()
        eventVC.event = allEvents.last
        eventVC.delegate = self
        
        let navCon = UINavigationController(rootViewController: eventVC)
        
        present(navCon, animated: true, completion: nil)
    }

    @IBAction func createCalendar(_ sender: Any) {
        var localSource: EKSource?
        
        for source in eventStore.sources{
            if source.sourceType == EKSourceType.local{
                localSource = source
                break
            }
        }
        
        var cal: EKCalendar?
        
        cal = EKCalendar.init(for: .event, eventStore: eventStore)
        
        cal?.title = "My App Calendar"
        cal?.source = localSource!;
        
        try! eventStore.saveCalendar(cal!, commit: true)
    } */
    
    // Réaliser un changement de page, bouton qui va vers un autre écran
    @IBAction func buttonCreateEvent(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateEventStep1ViewController") as! CreateEventStep1ViewController
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
 
    
}

extension EventViewController: EKEventViewDelegate {
    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
        dismiss(animated: true, completion: nil)
    }
}

extension EventViewController: EKEventEditViewDelegate, UINavigationControllerDelegate {
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: nil)
    }
    
     */

}
 
