//
//  StudentViewCell.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/18/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class StudentViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileViewImage: UIImageView!
    
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    var student:Student? = nil {
        didSet {
            self.setUpContent()
            
        }
        
    }
   
    
    func setUpContent() {
        
        self.firstNameLabel.text = student!.name
        
        profileViewImage.layer.borderWidth = 2.0
        profileViewImage.layer.borderColor = UIColor.greenColor().CGColor
        profileViewImage.layer.masksToBounds = false
        profileViewImage.clipsToBounds = true
        profileViewImage.layer.cornerRadius = 75/2
        profileViewImage.image = UIImage(named:student!.imagePath)
        
   
        
    }
    
}
