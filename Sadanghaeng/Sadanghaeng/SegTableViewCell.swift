//
//  SegTableViewCell.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 4..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class SegTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nickname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
