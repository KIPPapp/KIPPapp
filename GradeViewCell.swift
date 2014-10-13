//
//  GradeViewCell.swift
//  kippapp
//
//  Created by Deepak Agarwal on 10/11/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit
import QuartzCore

class GradeViewCell: UITableViewCell {

    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var checkBoxContainer: UIView!
    @IBOutlet weak var gradeOne: UILabel!
    @IBOutlet weak var gradeTwo: UILabel!
    @IBOutlet weak var gradeThree: UILabel!
    
    var student:Student? = nil {
        didSet {
            studentName.text = student!.name
            var grade = (student!.progress as NSNumber).stringValue
            gradeOne.text = " \(grade) "
            grade = (student!.currentNumTries as NSNumber).stringValue
            gradeTwo.text = " \(grade) "
            grade = (student!.minLastWeek as NSNumber).stringValue
            gradeThree.text = " \(grade) "
            
        }
        
    }
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
  /*      var backgroundGradientView: MBGradientView = MBGradientView(self.contentView.frame)
        backgroundGradientView.color1 = UIColor.whiteColor()
        backgroundGradientView.color2 = UIColor(hexString: "F3F3F3")
        backgroundGradientView.gradientStartPoint.  = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
        backgroundGradientView.gradientEndPoint = [NSValue valueWithCGPoint:CGPointMake(0, 0.5)];
        self.backgroundView = backgroundGradientView;
        [backgroundGradientView release]; */
        
        
        gradeOne.backgroundColor =  UIColor(red: 0.8, green: 0.0, blue: 0.0, alpha: 1.0)
        gradeOne.layer.borderColor = UIColor.lightGrayColor().CGColor
        gradeOne.text = " 6 "
        gradeOne.layer.borderWidth = 1;
        gradeOne.layer.cornerRadius = 10;
        gradeOne.layer.masksToBounds = true;
        
        gradeTwo.backgroundColor =  UIColor(red: 0.0, green: 0.8, blue: 0.0, alpha: 1.0)
        gradeOne.layer.borderColor = UIColor.lightGrayColor().CGColor
        gradeTwo.text = " 0 "
        gradeTwo.layer.borderWidth = 1;
        gradeTwo.layer.cornerRadius = 10;
        gradeTwo.layer.masksToBounds = true;
    
        gradeThree.backgroundColor =  UIColor(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
        gradeOne.layer.borderColor = UIColor.lightGrayColor().CGColor
        gradeThree.text = " 4 "
        gradeThree.layer.borderWidth = 1;
        gradeThree.layer.cornerRadius = 10;
        gradeThree.layer.masksToBounds = true;
        
        
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
