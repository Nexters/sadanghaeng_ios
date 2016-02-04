//
//  CommentTableViewCell.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 4..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var comment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
