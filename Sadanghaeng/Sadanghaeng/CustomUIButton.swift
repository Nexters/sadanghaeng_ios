//
//  CustomUIButton.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 1..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class CustomUIButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 33
       
    }
}
