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
    //MARK:-  Block 2
    //MARK:-  Block 3

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

    }
    
    @IBAction func buttonSeeMoreCreatedEvent(_ sender: Any) {
    }
    
    @IBAction func buttonSeeMoreParticipatedEvent(_ sender: Any) {
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
