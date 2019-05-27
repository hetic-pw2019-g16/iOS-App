//
//  View.swift
//  clunch
//
//  Created by Samy on 31/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

extension UIView {
    
    func hideKeyboardOnTouch(){
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.endEditing(_:))))
    }

    
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
    
    func addShadow(withRadius:Bool = true, radius:CGFloat = 5)  {
        if (withRadius){
            self.layer.cornerRadius = radius
        }
        self.layer.shadowColor = UIColor.init(red: 218/255, green: 218/255, blue: 176/255, alpha: 0.5).cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10
    }
    
    
    func setBulletPoit(creator: Bool, participant: Bool) {
        self.layer.cornerRadius = 5
        
        if creator || participant {
            if creator {
                self.backgroundColor = UIButton.yellow
                self.isHidden = false
            }
            
            if participant {
                self.backgroundColor = UITextField.pink
                self.isHidden = false
            }
        } else {
            self.isHidden = true
        }
    }
}
