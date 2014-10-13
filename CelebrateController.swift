//
//  CelebrateController.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/11/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class CelebrateController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    var studentList:[Student] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.view.showActivityViewWithLabel("Loading")
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        var parseAPI:ParseAPI = (self.tabBarController as KippAppController).parseAPI
       
       
        parseAPI.getStudentData("Mia Hamm", grade:"Secondary Intervention") { (students, groups,error) -> () in
            for student in students! {
                self.studentList.append(student)
            }
       
            self.studentList.sort({ $0.progress > $1.progress })
            self.view.hideActivityView()
            self.tableView.reloadData()
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.studentList.count/4
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CelebrateCell") as CelebrateStudentViewCell
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

    

    @IBOutlet weak var tableView: UITableView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
