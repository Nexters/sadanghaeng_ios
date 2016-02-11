//
//  CustomCommentField.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 11..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class CustomCommentField: UITextField {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.borderColor = UIColor(red: 252/255, green: 86/255, blue: 80/255, alpha: 1).CGColor
        self.layer.borderWidth = CGFloat(Float(1.0));
        self.layer.cornerRadius = 5
        
    }
}
