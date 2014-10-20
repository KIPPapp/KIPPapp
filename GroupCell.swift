//
//  GroupCell.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/12/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = 2.0
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.backgroundColor = UIColor(red: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), green: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), blue: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), alpha: CGFloat(Float(arc4random()) / Float(UINT32_MAX)))
    }
    
    var group:String? = nil {
        didSet {
            groupName.text = group!
            
            
        }
        
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBOutlet weak var groupName: UILabel!
    
}
