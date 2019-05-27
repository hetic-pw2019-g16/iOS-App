//
//  CategoryItemTableViewCell.swift
//  clunch
//
//  Created by Samy on 28/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

class CategoryItemTableViewCell: UITableViewCell {
   
    @IBOutlet weak var imageCategoryView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    
    static let identifier = "category_cell_identifier"
    
    var item: CategoryItem! {
        didSet {
            nameLabel.text = item.name
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
