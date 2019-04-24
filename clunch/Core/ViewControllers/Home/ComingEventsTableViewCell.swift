//
//  ComingEventsTableViewCell.swift
//  clunch
//
//  Created by Eléa on 12/03/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class ComingEventsTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var eventCreator: UILabel!
    @IBOutlet weak var mealTitle: UILabel!
    @IBOutlet weak var inscriptionNumber: UILabel!
    @IBOutlet weak var commentaries: UILabel!
    @IBOutlet weak var backView: UIView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
