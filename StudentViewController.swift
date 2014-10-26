//
//  StudentViewController.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/18/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

protocol StudentViewer : class
{
    func showStudent(student:Student)
    
}


class StudentViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, StudentViewer {
    
    @IBOutlet weak var attendaceButton: UIButton!
    var attendanceMode:Bool = false
    var selectedStudent:Student? = nil
    @IBAction func showAttendance(sender: AnyObject) {
        if (attendanceMode == false) {
            attendanceMode = true
            NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
                self.attendaceButton.highlighted = true
                
            }
        }
        else {
            attendanceMode = false
            NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
                self.attendaceButton.highlighted = false
            }

        }
        collectionView.reloadData()
    }
    var studentList:[Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()
   //     self.collectionView.showActivityViewWithLabel("Loading")
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 85, height: 130)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        var parseAPI:ParseAPI = (self.tabBarController as KippAppController).parseAPI
        
       
        parseAPI.getStudentData("Mia Hamm", grade:"Secondary Intervention") { (students, groups,error) -> () in
            for student in students! {
                self.studentList.append(student)
            }
            self.studentList.sort({$0.name.localizedCaseInsensitiveCompare($1.name) == NSComparisonResult.OrderedAscending})
     //       self.collectionView.hideActivityView()
            self.collectionView.reloadData()
            
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showStudent(student:Student) {
        selectedStudent = student
        performSegueWithIdentifier("showProfile", sender: self)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return studentList.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("StudentCell", forIndexPath: indexPath) as StudentViewCell
        cell.delegate = self
        if (attendanceMode == true) {
            cell.type = "attendance"
        }
        else {
            cell.type = "roster"
        }
        cell.student = studentList[indexPath.row]
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showProfile") {
            let navigationController = segue.destinationViewController as UINavigationController
            let detailViewController = navigationController.viewControllers[0] as StudentProfilePageViewController
            detailViewController.student = selectedStudent
            
        }
        
    }

    @IBOutlet weak var collectionView: UICollectionView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
