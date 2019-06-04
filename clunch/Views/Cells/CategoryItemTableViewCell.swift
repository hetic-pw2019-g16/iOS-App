//
//  CategoryItemTableViewCell.swift
//  clunch
//
//  Created by Samy on 28/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit
import AlamofireImage

class CategoryItemTableViewCell: UITableViewCell {
   
    @IBOutlet weak var imageCategoryView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    
    static let identifier = "category_cell_identifier"
    
    
    var item: CategoryItem! {
        didSet {
            nameLabel.text = item.name
            imageCategoryView?.af_setImage(withURL: item.image)
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
         self.imageCategoryView.alpha = 0.6
        
    }
    
}
