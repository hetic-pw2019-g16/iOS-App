//
//  EventItemTableViewCell.swift
//  clunch
//
//  Created by Eléa on 31/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class EventItemTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier = "event_cell_identifier"

    var item: Event! 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
