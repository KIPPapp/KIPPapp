//
//  CheckinStudentCell.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/11/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class CheckinStudentCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var student:Student? = nil {
        didSet {
            groupLabel.text = student!.groupName
            studentNameLabel.text = student!.name
            
        }
        
    }
    @IBOutlet weak var groupLabel: UILabel!

    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var profileViewImage: UIImageView!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
