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
    
   
    
    var createdEvents:[Event] = [Event(title: "Event 1",
                                       commentaries: ["Commentaire 1", "Commentaire 2"])]
    
    var participatedEvents:[Event] = [Event(title:"Participated 1",
                                            commentaries: ["Commentaire 1"]),
                                      Event(title: "eheheh 2",
                                            commentaries: ["Commentaire 1", "Commentaire 2", "Commentaire 3"]),
                                      Event(title: "eheheh 3",
                                            commentaries: ["Commentaire 1", "Commentaire 2", "Commentaire 3"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            
            cell.dateTitle.text = self.createdEvents[indexPath.row].title
            let commentaryNumber = self.createdEvents[indexPath.row].commentaries.count
            cell.commentaries.text = String(format: "%d commentaires", commentaryNumber)
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ParticipatedEventCell",
                                                          for: indexPath) as! ParticipatedEventCell
            
            cell.dateTitle.text = self.participatedEvents[indexPath.row].title
            let commentaryNumber = self.participatedEvents[indexPath.row].commentaries.count
            cell.commentaries.text = String(format: "%d commentaires", commentaryNumber)
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
        cell.eventCreator.text = "Eléa la plus forte en dev IOS"
        return cell
        
    }
    
    
}
