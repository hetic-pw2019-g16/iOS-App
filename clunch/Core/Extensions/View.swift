//
//  View.swift
//  clunch
//
//  Created by Samy on 31/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

extension UIView {
    func popUp() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 1
//        self.layer.shadowOffset = CGSize.zero
//        self.layer.shadowRadius = 10
//        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//        self.layer.shouldRasterize = true
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 5
        
        self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
