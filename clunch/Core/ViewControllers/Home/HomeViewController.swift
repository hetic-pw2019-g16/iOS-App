//
//  HomeViewController.swift
//  clunch
//
//  Created by Samy on 27/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    //MARK:-  Block 0
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
    
    
    var createdEvents:[Event] = [Event(title: "24",
                                       commentaries: ["Commentaire 1", "Commentaire 2"])]
    
    var participatedEvents:[Event] = [Event(title:"12",
                                            commentaries: ["Commentaire 1"]),
                                      Event(title: "15",
                                            commentaries: ["Commentaire 1", "Commentaire 2", "Commentaire 3"]),
                                      Event(title: "26",
                                            commentaries: ["Commentaire 1", "Commentaire 2", "Commentaire 3"])]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
    
        
        
        self.createdEventCollectionView.delegate = self
        self.participatedEventCollectionView.delegate = self

        self.createdEventCollectionView.dataSource = self
        self.participatedEventCollectionView.dataSource = self
        
        self.comingEventsTableView.delegate = self
        self.comingEventsTableView.dataSource = self

    }
    
    @IBAction func buttonSeeMoreCreatedEvent(_ sender: Any) {
    }


    
    @IBAction func buttonSeeMoreParticipatedEvent(_ sender: Any) {
    }
    
    @IBAction func buttonSeeAllComingEvents(_ sender: Any) {
    }
    
    @IBAction func buttonFindAnEvent(_ sender: Any) {
    }
    
    @IBAction func buttonCreateAnEvent(_ sender: Any) {
    
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
            cell.dateTitle.text = self.createdEvents[indexPath.row].title
            let commentaryNumber = self.createdEvents[indexPath.row].commentaries.count
            cell.commentaries.text = String(format: "%d commentaires", commentaryNumber)
            cell.eventCreatedViewCell.addShadow()
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ParticipatedEventCell",
                                                          for: indexPath) as! ParticipatedEventCell
            
            cell.dateTitle.text = self.participatedEvents[indexPath.row].title
            let commentaryNumber = self.participatedEvents[indexPath.row].commentaries.count
            cell.commentaries.text = String(format: "%d commentaires", commentaryNumber)
            cell.eventParticipatedView.addShadow()
            return cell
        }
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComingEventsTableViewCell", for: indexPath) as! ComingEventsTableViewCell
        cell.eventCreator.text = "FELIX"
        return cell
        
    }
    
    
    
}
