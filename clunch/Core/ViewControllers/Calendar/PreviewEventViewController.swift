//
//  PreviewEventViewController.swift
//  clunch
//
//  Created by Eléa on 25/04/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class PreviewEventViewController: UIViewController {

    @IBOutlet weak var creatorEventImage: UIImageView!
    @IBOutlet weak var creatorEventLabel: UILabel!
    @IBOutlet weak var mealTitleLabel: UILabel!
    @IBOutlet weak var mealDescriptionLabel: UILabel!
    @IBOutlet weak var validateActionButton: UIButton!
    @IBOutlet weak var nameParticipantsLabel: UILabel!
    @IBOutlet weak var hourEventLabel: UILabel!
    @IBOutlet weak var dateEventLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func validateButtonAction(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
