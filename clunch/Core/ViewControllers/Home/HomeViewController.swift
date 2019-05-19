//
//  HomeViewController.swift
//  clunch
//
//  Created by Eléa on 27/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var user: User = User()

    
    //MARK:-  Header
    
    @IBOutlet weak var profileButton: UIBarButtonItem!
    @IBOutlet weak var notificationButton: UIBarButtonItem!
    //MARK:-  myEventsView
    @IBOutlet weak var myEventsView: UIView!
    @IBOutlet weak var homeCreatedEvent: UILabel!
    @IBOutlet weak var homeEventLabel: UILabel!
    @IBOutlet weak var homeParticipatedEvent: UILabel!
    @IBOutlet weak var buttonSeeMoreCreatedEvent: UIButton!
    @IBOutlet weak var buttonSeeMoreParticpatedEvent: UIButton!
    @IBOutlet weak var createdEventCollectionView: UICollectionView!
    @IBOutlet weak var participatedEventCollectionView: UICollectionView!
    //MARK:-  comingEventsView
    @IBOutlet weak var comingEventsView: UIView!
    @IBOutlet weak var comingEventsLabel: UILabel!
    @IBOutlet weak var comingEventsTableView: UITableView!
    @IBOutlet weak var buttonSeeAllComingEvents: UIButton!
    //MARK:-  newRecipes
    @IBOutlet weak var newRecipesView: UIView!
    @IBOutlet weak var newRecipesLabel: UIView!
    
    @IBOutlet weak var newRecipe1: UIView!
    @IBOutlet weak var imageRecipe1: UIImageView!
    @IBOutlet weak var recipeTitleLabel1: UILabel!
    @IBOutlet weak var recipeTimeLabel1: UILabel!
    
    @IBOutlet weak var newRecipe2: UIView!
    @IBOutlet weak var imageRecipe2: UIImageView!
    @IBOutlet weak var recipeTitleLabel2: UILabel!
    @IBOutlet weak var recipeTimeLabel2: UILabel!
    
    @IBOutlet weak var newRecipe3: UIView!
    @IBOutlet weak var imageRecipe3: UIImageView!
    @IBOutlet weak var recipeTitleLabel3: UILabel!
    @IBOutlet weak var recipeTimeLabel3: UILabel!
    
    @IBOutlet weak var newRecipe4: UIView!
    @IBOutlet weak var imageRecipe4: UIImageView!
    @IBOutlet weak var recipeTitleLabel4: UILabel!
    @IBOutlet weak var recipeTimeLabel4: UILabel!
    
    //MARK:-  KnowMore
    @IBOutlet weak var knowMoreLabel: UILabel!
    @IBOutlet weak var buttonFindAnEvent: UIButton!
    @IBOutlet weak var buttonCreateAnEvent: UIButton!
    
    
    
    var createdEvents:[Event] = []
    var participatedEvents:[Event] = []
    var events: [Event] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let user:User = UserDefaults.getTheUserStored() ?? User()
        
        buttonSeeMoreCreatedEvent.buttonStyle(color: UIButton.green)
        buttonSeeMoreParticpatedEvent.buttonStyle(color: UIButton.green)
        buttonSeeAllComingEvents.buttonStyle(color: UIButton.green)

        
        self.buttonFindAnEvent.backgroundColor = .white
        self.buttonFindAnEvent.layer.cornerRadius = 5
        self.buttonFindAnEvent.layer.borderWidth = 2
        self.buttonFindAnEvent.layer.borderColor = UIColor(red: 89/255, green: 190/255, blue: 176/255, alpha: 1).cgColor
        
        self.buttonCreateAnEvent.backgroundColor = .white
        self.buttonCreateAnEvent.layer.cornerRadius = 5
        self.buttonCreateAnEvent.layer.borderWidth = 2
        self.buttonCreateAnEvent.layer.borderColor = UIColor(red: 89/255, green: 190/255, blue: 176/255, alpha: 1).cgColor
        
        self.newRecipe1.addShadow(withRadius: true, radius: 5)
        self.newRecipe2.addShadow(withRadius: true, radius: 5)
        self.newRecipe3.addShadow(withRadius: true, radius: 5)
        self.newRecipe4.addShadow(withRadius: true, radius: 5)
        
    
        profileButton.width = 30
        
        
        self.createdEventCollectionView.delegate = self
        self.participatedEventCollectionView.delegate = self

        self.createdEventCollectionView.dataSource = self
        self.participatedEventCollectionView.dataSource = self
        
        self.comingEventsTableView.delegate = self
        self.comingEventsTableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getEvents()
    }
 
    
    func loadparticipatedEvents () {
        let me = UserDefaults.getTheUserStored()
        var i = 0
        var j = 0
        self.participatedEvents = []
        while (i < self.events.count){
            while (j < self.events[i].participants.count){
                if (me?.username == self.events[i].participants[j].username){
                    self.participatedEvents.append(self.events[i])
                }
                j = j+1
            }
            i = i+1
        }
    }
    
    func loadCreatedEvents () {
        let me = UserDefaults.getTheUserStored()
        var i = 0
        self.createdEvents = []
        while (i < self.events.count){
            if (me?.username == self.events[i].user.username){
                self.createdEvents.append(self.events[i])
            }
            i = i+1
        }
    }
    
    func getEvents(){
        CalendarService.getEventListByCompagny(companyId: UserDefaults.getCompanyId()!, callBack: {(res, error) in
            self.events = res
            self.loadCreatedEvents()
            self.loadparticipatedEvents()
            print(self.createdEvents.count)
            print(self.participatedEvents.count)
            self.createdEventCollectionView.reloadData()
            self.participatedEventCollectionView.reloadData()
            self.comingEventsTableView.reloadData()
        })
    }
    
    @IBAction func briefcaseAction(_ sender: Any) {
        let vc2 = UIStoryboard(name: "Briefcase", bundle: nil).instantiateViewController(withIdentifier: "BriefcaseMenuViewController") as! BriefcaseMenuViewController
       // let vc = self.storyboard?.instantiateViewController(withIdentifier: "BriefcaseMenuViewController") as! BriefcaseMenuViewController
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    @IBAction func notificationAction(_ sender: Any) {
    }
    @IBAction func buttonSeeMoreCreatedEvent(_ sender: Any) {
        let vc = UIStoryboard(name: "Calendar", bundle: nil).instantiateViewController(withIdentifier: "CreatedEventsViewController") as! CreatedEventsViewController
        vc.events = self.createdEvents
        self.navigationController?.pushViewController(vc, animated: true)
    }


    
    @IBAction func buttonSeeMoreParticipatedEvent(_ sender: Any) {
        let vc = UIStoryboard(name: "Calendar", bundle: nil).instantiateViewController(withIdentifier: "RegisteredEventsViewController") as! RegisteredEventsViewController
        vc.events = self.participatedEvents
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func buttonSeeAllComingEvents(_ sender: Any) {

        let vc = UIStoryboard(name: "Calendar", bundle: nil).instantiateViewController(withIdentifier: "ComingEventsViewController") as! ComingEventsViewController
        vc.events = self.events
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func buttonFindAnEvent(_ sender: Any) {
        let vc = UIStoryboard(name: "Calendar", bundle: nil).instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func buttonCreateAnEvent(_ sender: Any) {
        let vc = UIStoryboard(name: "CreateEvent", bundle: nil).instantiateViewController(withIdentifier: "CreateEventStep1ViewController") as! CreateEventStep1ViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
    
}



extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == self.createdEventCollectionView){
            return self.createdEvents.count
        }
        else {
            return self.participatedEvents.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            
        if (collectionView == self.createdEventCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreatedEventCell",
                                                          for: indexPath) as! CreatedEventCell
            
           // cell.event = self.createdEvents[indexPath.row] // regarder EventItemTableViewCell.item
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            let dateStr = dateFormatter.string(from: self.createdEvents[indexPath.row].date)
            let gooddate = dateStr.toString(to: 8)
            cell.dateTitle.text = gooddate
            cell.mealTitle.text = self.createdEvents[indexPath.row].recipe
            cell.eventCreator.text = self.createdEvents[indexPath.row].user.username
            cell.inscriptionNumber.text = String(format: "%d participants", self.createdEvents[indexPath.row].participants.count)
            cell.eventCreatedViewCell.addShadow()
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ParticipatedEventCell",
                                                          for: indexPath) as! ParticipatedEventCell
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            let dateStr = dateFormatter.string(from: self.participatedEvents[indexPath.row].date)
            let gooddate = dateStr.toString(to: 8)
            cell.dateTitle.text = gooddate
            cell.mealTitle.text = self.participatedEvents[indexPath.row].recipe
            cell.eventCreator.text = self.participatedEvents[indexPath.row].user.username
            cell.inscriptionNumber.text = String(format: "%d participants", self.participatedEvents[indexPath.row].participants.count)
            cell.eventParticipatedView.addShadow()
            return cell
        }
     }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.events.count < 4){
            return self.events.count
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComingEventsTableViewCell", for: indexPath) as! ComingEventsTableViewCell
        
        let tmpEvent = self.events[indexPath.row]
        cell.eventCreator.text = tmpEvent.user.username
        cell.mealTitle.text = tmpEvent.recipe
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let dateStr = dateFormatter.string(from: self.events[indexPath.row].date)
        let gooddate = dateStr.toString(to: 8)
        cell.dateTitle.text = gooddate
        cell.inscriptionNumber.text = String(format: "%d participants", self.events[indexPath.row].participants.count)
        
        
        
        return cell
        
    }
}



