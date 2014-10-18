//
//  CheckinController.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/11/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class CheckinController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var studentList:[Student] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.estimatedRowHeight = 110
        self.tableView.rowHeight = UITableViewAutomaticDimension

        // Do any additional setup after loading the view.
        self.view.showActivityViewWithLabel("Loading")
        var parseAPI:ParseAPI = (self.tabBarController as KippAppController).parseAPI
        parseAPI.getStudentData("Mia Hamm", grade:"Secondary Intervention") { (students, groups, error) -> () in
            for student in students! {
                if (student.currentNumTries >= 3) {
                    self.studentList.append(student)
                }
            }
            self.view.hideActivityView()
            self.tableView.reloadData()
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CheckinStudentCell") as CheckinStudentCell
        cell.student = studentList[indexPath.row]
        
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showAcademicRecord") {
            
            var indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            let student = studentList[indexPath.row]
            
            let navigationController = segue.destinationViewController as UINavigationController
            let detailViewController = navigationController.viewControllers[0] as StudentAcademicPageViewController
            detailViewController.student = student
            
        }
        
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
