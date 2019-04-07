//
//  Text.swift
//  clunch
//
//  Created by Samy on 27/01/2019.
//  Copyright © 2019 Clunch. All rights reserved.
//

import UIKit

extension UIButton {
    
        
        static let yellow = UIColor(red:1.00, green:0.76, blue:0.33, alpha:1.0)
        static let green = UIColor(red: 89/255, green: 190/255, blue: 176/255, alpha: 1)
        static let greyblack = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
        static let greyclear = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        
       func buttonStyle(color:UIColor) {
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: self.frame.size.height, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = color.cgColor
        self.layer.addSublayer(bottomLine)
    }
    
}

extension UITextField {
    
    static let yellow = UIColor(red:1.00, green:0.76, blue:0.33, alpha:1.0)
    static let green = UIColor(red: 89/255, green: 190/255, blue: 176/255, alpha: 1)
    static let greyblack = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
    static let greyclear = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
    static let pink = UIColor(red: 246/255, green: 105/255, blue: 118/255, alpha: 1)
    
    func loginTextStyle(color:UIColor) {
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: self.frame.size.height, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = color.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
    
    func loginTextStyleNear(color:UIColor) {
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: self.frame.size.height-12, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = color.cgColor
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
        self.textColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
    }
    func setSize(size:CGFloat) {
        self.font = self.font.withSize(size)
    }
    func setClunchSubTitleTextColor() {
        self.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
    }
    func setClunchButtonColor() {
        self.textColor = UIColor(red: 89/255, green: 190/255, blue: 176/255, alpha: 1)
    }

    
}
