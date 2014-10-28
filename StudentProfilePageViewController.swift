//
//  StudentProfilePageViewController.swift
//  kippapp
//
//  Created by isai on 10/11/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class StudentProfilePageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var starImage: UIImageView!
  
   
    @IBAction func goToNotes(sender: AnyObject) {
        
        performSegueWithIdentifier("goToNotes", sender: self)
    }


    @IBOutlet weak var studentNameLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var primaryContactName: UILabel!
    var student:Student? = nil
    
    var stats:[String] = [String]()
    
    @IBOutlet weak var masteredLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
     
    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    
    
    override func viewWillAppear(animated: Bool) {
        studentNameLabel.text = student!.name
        profileImageView.layer.masksToBounds = false
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 50
        profileImageView.image = UIImage(named: student!.imagePath)
        setupAttendanceColor()
        
        masteredLabel.text =  NSString(format: "%.1f %%", student!.mastery)
        progressLabel.text = NSString(format: "%.1f %%", student!.progress)
        
        stats = ["Attendance","Last time celebrated","Number of tries","Min last week","Weeks on topic"]
        if (student!.celebrated) {
            starImage.image = UIImage(named:"green-star.png")
        }
        
    }

    func setupAttendanceColor() {
        profileImageView.layer.borderWidth = 3.0
        if (student!.attendance == "present") {
            profileImageView.layer.borderColor = UIColor.greenColor().CGColor
        }
        else if (student!.attendance == "absent") {
            profileImageView.layer.borderColor = UIColor.redColor().CGColor
        }
        else if (student!.attendance == "tardy") {
            profileImageView.layer.borderColor = UIColor.yellowColor().CGColor
        }
        else {
            profileImageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 148, height: 80)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor(red: 59/255, green: 98/255, blue: 157/255, alpha: 1.0)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData();
      

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stats.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("StudentStatCell", forIndexPath: indexPath) as StudentStatCell
        let labelName = stats[indexPath.row]
         cell.statTitleLabel.text = labelName
        if (labelName == "Attendance") {
            var present = Int(arc4random_uniform(5))
            var absent = 5 - present
            cell.statValueLabel.text = NSString(format: "%d, %d, %d", present,absent,0)
        }
            
        else if (labelName == "Number of tries") {
            cell.statValueLabel.text =  NSString(format: "%d", student!.currentNumTries)
        }
            
        else if (labelName == "Last time celebrated") {
            cell.statValueLabel.text = "10/03/2014"
        }
        else if (labelName == "Min last week") {
             cell.statValueLabel.text =  NSString(format: "%d", student!.minLastWeek)
        }
        
        else if (labelName == "Weeks on topic") {
            cell.statValueLabel.text =   NSString(format: "%d", Int(arc4random_uniform(4)))
        }
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
