//
//  CalendarViewController.swift
//  clunch
//
//  Created by Eléa on 27/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {
    enum lastViewController {
        case first
        case second
        case third
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var segmentedView: UIView!
    
    var lastVCToRemove: lastViewController = lastViewController.first
    
    
    
    //@IBOutlet weak var tableView: UITableView!
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
        
        setupView()
        
        
        self.title = "Calendrier"

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

    }
    
    private func setupView() {
        setupSegmentedControl()
        updateView()
    }
    
    //MARK:- RECUPERER LES EVENEMENTS
    func getEvents(){
        CalendarService.getEventListByCompagny(companyId: UserDefaults.getCompanyId()!, callBack: {(res, error) in
            self.events = res
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
            self.lastVCToRemove = .first
            
        } else if segmentedControl.selectedSegmentIndex == 1 {
            add(asChildViewController: RegisteredEventsViewController)
            self.lastVCToRemove = .second
        } else {
            add(asChildViewController: CreatedEventsViewController)
            self.lastVCToRemove = .third
        }
    }
    
    //MARK:- AFFICHER LA COULEUR DE LA CELLULE SI EVENEMENT
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
    //MARK:- MONTRER L'EVENEMENT
    func showPopUp(date: Date) {
        let popUp = UIStoryboard(name: "Calendar", bundle: nil).instantiateViewController(withIdentifier: "eventPopUp") as! CalendarEventViewController

        popUp.date = date
        let popUpNav = UINavigationController(rootViewController: popUp)
        self.present(popUpNav, animated: true, completion: nil)
    }
    
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
        handleCellTextColor(view: cell, cellState: cellState, date: date)

        // Faire la correspondance entre la date actuelle et tous les eventes de self.events qui ont la meme date
        // si il y a des event alors mettre le truc vert
        // Parmi ces events voir si je suisinclu dedans et mettre pastille en consequence
        
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



