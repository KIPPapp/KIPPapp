//
//  StudentViewController.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/18/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var studentList:[Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 85, height: 130)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        var parseAPI:ParseAPI = (self.tabBarController as KippAppController).parseAPI
        
        self.view.showActivityViewWithLabel("Loading")
        parseAPI.getStudentData("Mia Hamm", grade:"Secondary Intervention") { (students, groups,error) -> () in
            for student in students! {
                self.studentList.append(student)
            }
            self.studentList.sort({$0.name.localizedCaseInsensitiveCompare($1.name) == NSComparisonResult.OrderedAscending})
            self.view.hideActivityView()
            self.collectionView.reloadData()
            
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return studentList.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("StudentCell", forIndexPath: indexPath) as StudentViewCell
        cell.student = studentList[indexPath.row]
        return cell
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
