//
//  Text.swift
//  clunch
//
//  Created by Samy on 27/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

extension UITextField {
    func loginTextStyle() {
        let yellow = UIColor(red:1.00, green:0.76, blue:0.33, alpha:1.0)
        let bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: self.frame.size.height, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = yellow.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
}

extension UILabel {
    
    static let titleSize:CGFloat = 24
    static let subTitleSize:CGFloat = 20
    static let TextSize:CGFloat = 16
    static let LittleTextSize:CGFloat = 13
    
    
    func setClunchTitleColor() {
        self.textColor = UIColor(red: 77, green: 77, blue: 77, alpha: 1)
    }
    func setSize(size:CGFloat) {
        self.font = self.font.withSize(size)
    }
    func setClunchSubTitleTextColor() {
        self.textColor = UIColor(red: 128, green: 128, blue: 128, alpha: 1)
    }
    func setClunchButtonColor() {
        self.textColor = UIColor(red: 89, green: 190, blue: 176, alpha: 1)
    }

    
}
