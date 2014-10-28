//
//  GroupStudentViewCell.swift
//  kippapp
//
//  Created by isai on 10/22/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class GroupStudentViewCell: UITableViewCell {

    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
