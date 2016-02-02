//
//  NewViewController.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 2..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    var titleString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = self.titleString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
