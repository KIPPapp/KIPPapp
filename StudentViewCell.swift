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
    
    @IBOutlet weak var studentState: UIButton!
    var type:String = "roster"
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
     weak var delegate:StudentViewer?
    
    var student:Student? = nil {
        didSet {
            self.setUpContent()
            
        }
        
    }
   
    
    @IBAction func checkIn(sender: AnyObject) {
        
        if (!student!.checkedIn) {
            studentState.setImage(UIImage(named:"checked.png"),forState: UIControlState.Normal)
            student!.checkedIn = true
        }
        
        
    }
    @IBAction func setCelebrate(sender: AnyObject) {
        if (!student!.celebrated) {

            studentState.setImage(UIImage(named:"green-star.png"),forState: UIControlState.Normal)
            
                student!.celebrated = true
        }
    }
    
    func setUpContent() {
        
        self.firstNameLabel.text = student!.name
        
       
        setupAttendanceColor()
        if (type == "roster") {
           studentState.hidden = false
         
            if (student!.progress > 1.0  && student!.mastery >= student!.progress - 3) {
                studentState.setImage(UIImage(named:"ok-small.png"),forState: UIControlState.Normal)           }
            else {
                studentState.setImage(UIImage(named:"Button-warning-icon.png"),forState: UIControlState.Normal)
            }
        
        } else if (type == "attendance") {
           
            self.studentState.hidden = true
        }
        else if (type == "celebrate") {
            profileViewImage.layer.borderColor = UIColor.grayColor().CGColor
            if (student!.celebrated) {
                 studentState.setImage(UIImage(named:"green-star.png"),forState: UIControlState.Normal)
            }
        }
        else if (type == "checkin") {
             profileViewImage.layer.borderColor = UIColor.grayColor().CGColor
            if (student!.checkedIn) {
               studentState.setImage(UIImage(named:"checked.png"),forState: UIControlState.Normal)  
            }
        }
        profileViewImage.layer.masksToBounds = false
        profileViewImage.clipsToBounds = true
        profileViewImage.layer.cornerRadius = 75/2
        profileViewImage.image = UIImage(named:student!.imagePath)
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action:"profileImageTapped:")
        profileViewImage.addGestureRecognizer(recognizer)

        
    }
    
    func profileImageTapped(sender: UITapGestureRecognizer) {
       
        if (type == "attendance") {
            // for now do nothing
            if (student!.attendance=="notset") {
                profileViewImage.layer.borderColor = UIColor.greenColor().CGColor
                student!.attendance = "present"
            }
            else if (student!.attendance == "present") {
                profileViewImage.layer.borderColor = UIColor.redColor().CGColor
                student!.attendance = "absent"
            }
            else if (student!.attendance == "absent") {
                profileViewImage.layer.borderColor = UIColor.yellowColor().CGColor
                student!.attendance = "tardy"
            }
            else if (student!.attendance == "tardy") {
                profileViewImage.layer.borderColor = UIColor.greenColor().CGColor
                student!.attendance = "present"
            }
        }
        else {
            self.delegate!.showStudent(student!)
        }
        
    }
    
    func setupAttendanceColor() {
        profileViewImage.layer.borderWidth = 3.0
        if (student!.attendance == "present") {
             profileViewImage.layer.borderColor = UIColor.greenColor().CGColor
        }
        else if (student!.attendance == "absent") {
            profileViewImage.layer.borderColor = UIColor.redColor().CGColor
        }
        else if (student!.attendance == "tardy") {
            profileViewImage.layer.borderColor = UIColor.yellowColor().CGColor
        }
        else {
           profileViewImage.layer.borderColor = UIColor.lightGrayColor().CGColor
        }

    }
    
}
