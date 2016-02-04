//
//  CustomTextField.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 1. 29..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).CGColor
        self.layer.borderWidth = CGFloat(Float(1.0));
        self.layer.cornerRadius = 5
        
    }
}
