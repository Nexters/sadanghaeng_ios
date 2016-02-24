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

class CustomRegisterButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.whiteColor().CGColor
        
    }
}


class CustomInputButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5
        
    }
}
