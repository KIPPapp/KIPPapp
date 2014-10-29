//
//  StudentViewController.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/18/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class CelebrateController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, StudentViewer {
    
    var studentList:[Student] = []
    var selectedStudent:Student? = nil
    
    
    func showStudent(student:Student) {
        selectedStudent = student
        performSegueWithIdentifier("showProfile", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showProfile") {
            let navigationController = segue.destinationViewController as UINavigationController
            let detailViewController = navigationController.viewControllers[0] as StudentProfilePageViewController
            detailViewController.student = selectedStudent
            
        }
        
    }

    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 85, height: 130)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor(red: 239/255, green: 248/255, blue: 255/255, alpha: 1.0)
        collectionView.dataSource = self
        collectionView.delegate = self
     
        var parseAPI:ParseAPI = (self.tabBarController as KippAppController).parseAPI
        parseAPI.getStudentData("Mia Hamm", grade:"Secondary Intervention") { (students, groups,error) -> () in
            for student in students! {
                self.studentList.append(student)
            }
            
            self.studentList.sort({ $0.progress > $1.progress })
                     self.collectionView.reloadData()
            
        }

        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return studentList.count/4
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("StudentCell", forIndexPath: indexPath) as StudentViewCell
        cell.type = "celebrate"
        cell.student = studentList[indexPath.row]
        cell.delegate = self
        cell.backgroundColor = UIColor(red: 239/255, green: 248/255, blue: 255/255, alpha: 1.0)
       
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
