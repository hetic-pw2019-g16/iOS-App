//
//  CalendarViewController.swift
//  clunch
//
//  Created by Eléa on 27/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit
import JTAppleCalendar


class DateHeader: JTAppleCollectionReusableView  {
        @IBOutlet weak var monthTitle: UILabel!
}


class CalendarViewController: UIViewController {
    enum lastViewController {
        case first
        case second
        case third
    }
    

    @IBOutlet weak var collectionView: JTAppleCalendarView!
    @IBOutlet weak var viewCalendarView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var segmentedView: UIView!
    
    var lastVCToRemove: lastViewController = lastViewController.first
    
    
    //@IBOutlet weak var tableView: UITableView!
    
    let green = UIColor(red:0.35, green:0.75, blue:0.69, alpha:1.0)
    let grey = UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0)
    let greyInactive = UIColor(red:0.50, green:0.50, blue:0.50, alpha:0.25)

    // TODO SET View in Main story board
    let viewEvent: UIView = UIView(frame: CGRect(x: 2, y: 0, width: 30, height: 30))
    
    let formatter = DateFormatter()
    
    var events = [Event]()
    var createdEvents: [Event] = []
    var participatedEvents: [Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.formatter.timeZone = Calendar.current.timeZone
        self.formatter.locale = Locale(identifier: "fr_FR")
        
        self.collectionView.scrollDirection = .horizontal
        self.collectionView.scrollingMode   = .stopAtEachCalendarFrame
    self.collectionView.showsHorizontalScrollIndicator = false
        
        self.viewCalendarView.addShadow(withRadius: true, radius: 7)
        
        setupView()
        
        

        /*
        self.tableView.delegate = self
        self.tableView.dataSource = self
        */
        
        self.collectionView.calendarDataSource = self
        self.collectionView.calendarDelegate = self
        
        // TODO Current User related events
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getEvents()
        setupView()
    }
    
    func loadparticipatedEvents () {
        var i = 0
        self.participatedEvents = []
        while (i < self.events.count){
            if (self.events[i].participating){
                self.participatedEvents.append(self.events[i])
            }
            i = i+1
        }
    }
    
    func loadCreatedEvents () {
        var i = 0
        self.createdEvents = []
        while (i < self.events.count){
            if (self.events[i].creator){
                self.createdEvents.append(self.events[i])
            }
            i = i+1
        }
    }
    
    private func setupView() {
        setupSegmentedControl()
        updateView()
    }
    
    //MARK:- RECUPERER LES EVENEMENTS
    func getEvents(){
        CalendarService.getEventListByCompagny(companyId: UserDefaults.getCompanyId()!, callBack: {(res, error) in
            self.events = res
            self.lastVCToRemove = .first
            self.updateView()
            self.loadCreatedEvents()
            self.loadparticipatedEvents()
            self.collectionView.reloadData()
        })
    }
    
    //MARK:- SEGMENTED CONTROL
    private func setupSegmentedControl() {
        // Configure Segmented Control
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        
        // Select First Segment
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    //MARK:- EVENEMNTS A VENIR
    private lazy var ComingEventsViewController: ComingEventsViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Calendar", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "ComingEventsViewController") as! ComingEventsViewController
        // viewController.events = self.events
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
   
    //MARK:- EVENEMNTS INSCRITS
    private lazy var RegisteredEventsViewController: RegisteredEventsViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Calendar", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "RegisteredEventsViewController") as! RegisteredEventsViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    //MARK:- EVENEMNTS CRÉÉS
    private lazy var CreatedEventsViewController: CreatedEventsViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Calendar", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "CreatedEventsViewController") as! CreatedEventsViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    //MARK:- AFFICHER L'UNE DES LISTES D'EVENEMENTS DANS LE SEGMENTED CONTROL
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        self.addChild(viewController)
        
        // Add Child View as Subview
        segmentedView.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = segmentedView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    //MARK:- SUPPRIMER L'UNE DES LISTES D'EVENEMENTS DANS LE SEGMENTED CONTROL
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
    //MARK:- PROCESSUS : AFFICHER ET SUPPRIMER L'UNE DES LISTES D'EVENEMENTS DANS LE SEGMENTED CONTROL
    private func updateView() {
        
        switch self.lastVCToRemove {
        case .first:
            remove(asChildViewController: ComingEventsViewController)
            break
        case .second:
            remove(asChildViewController: RegisteredEventsViewController)
            break
        case .third:
            remove(asChildViewController: CreatedEventsViewController)
            break
        }
        
        if segmentedControl.selectedSegmentIndex == 0 {
            add(asChildViewController: ComingEventsViewController)
            ComingEventsViewController.refreshEvents(allEvents: self.events)
            self.lastVCToRemove = .first
            
        } else if segmentedControl.selectedSegmentIndex == 1 {
            add(asChildViewController: RegisteredEventsViewController)
            RegisteredEventsViewController.refreshEvents(allEvents: self.participatedEvents)
            self.lastVCToRemove = .second
        } else {
            add(asChildViewController: CreatedEventsViewController)
            CreatedEventsViewController.refreshEvents(allEvents: self.createdEvents)
            self.lastVCToRemove = .third
            
        }
    }
    
    //MARK:- AFFICHER LA COULEUR DE LA CELLULE SI EVENEMENT
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState, date: Date! = nil) {
        guard let cell = view as? CalendarItemCell else { return }
        if cellState.isSelected {
            cell.cellDay.textColor = .white
            if date != nil {
                //showPopUp(date: date)
            }
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                cell.cellDay.textColor = grey
            } else {
                cell.cellDay.textColor = greyInactive
            }
        }
    }
    //MARK:- MONTRER L'EVENEMENT
   /* func showPopUp(date: Date) {
        let popUp = UIStoryboard(name: "Calendar", bundle: nil).instantiateViewController(withIdentifier: "eventPopUp") as! CalendarEventViewController

        popUp.date = date
        let popUpNav = UINavigationController(rootViewController: popUp)
        self.present(popUpNav, animated: true, completion: nil)
    }*/
    
    //MARK:- TRIER LES EVENEMENTS
    func sortEventsByDate(){
        self.events.sort {$0.date < $1.date}
    }
}


/*
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
*/

//MARK:- CALENDRIER
extension CalendarViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        // Faire la correspondance entre la date actuelle et tous les eventes de self.events qui ont la meme date
        // si il y a des event alors mettre le truc vert
        // Parmi ces events voir si je suisinclu dedans et mett re pastille en consequence
        let eventCell = cell as! CalendarItemCell
        if eventCell.event != nil {
            handleCellTextColor(view: cell, cellState: cellState, date: date)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PreviewEventViewController") as! PreviewEventViewController
            vc.event = eventCell.event
            let nav = self.navigationController
            nav?.pushViewController(vc, animated: true)
        }
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState, event: Event?) {
        if event == nil {
            handleCellTextColor(view: cell, cellState: cellState)
            cell?.backgroundColor = UIColor.white
        }
    }
    
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
        return
    }
    
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        self.formatter.dateFormat = "yyyy MM dd"
        
        
        let startDate = Date()
        let endDate = formatter.date(from: "2019 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: 6, generateOutDates: .tillEndOfRow)
        return parameters
    }
    
   func calendar(_ calendar: JTAppleCalendarView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTAppleCollectionReusableView {
    self.formatter.dateFormat = "MMMM"
      let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "DateHeader", for: indexPath) as! DateHeader
      header.monthTitle.text = formatter.string(from: range.start).capitalized
      return header
   }
    
       func calendarSizeForMonths(_ calendar: JTAppleCalendarView?) -> MonthSize? {
       return MonthSize(defaultSize: 50)
  }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let myCustomCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarItemCell
        
        self.calendar(calendar, willDisplay: myCustomCell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        
        myCustomCell.cellDay.text = cellState.text
        
        //handleCellTextColor(view: myCustomCell, cellState: cellState, date: date)
        
        if cellState.dateBelongsTo == .thisMonth {
            myCustomCell.cellDay.textColor = grey
        } else {
            myCustomCell.cellDay.textColor = greyInactive
        }
        
        let array:[Event] = self.bulletPoint(cellDate: date)
        if (array.count != 0) {
            myCustomCell.cellDay.textColor = .white
            myCustomCell.backgroundColor = green
            myCustomCell.setRadius(radius: 5)
            myCustomCell.bulletPointView.setColor(creator: array[0].creator, participant: array[0].participating)
            myCustomCell.bulletPointView.setRadius(radius: 5)
            myCustomCell.event = array[0]
        } else {
            myCustomCell.backgroundColor = UIColor.white
            myCustomCell.layer.cornerRadius = 0

            myCustomCell.bulletPointView.isHidden = true
        }
        
        return myCustomCell
    }
    
    func bulletPoint(cellDate: Date) -> [Event]{
        var array : [Event] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let dateStr = dateFormatter.string(from: cellDate)
        
        var i : Int = 0
        while (i < self.events.count) {
            let eventDateStr = dateFormatter.string(from: self.events[i].date)
            if (dateStr == eventDateStr) {
                array.append(self.events[i])
            }
            i = i+1
        }
        return array
    }
}

