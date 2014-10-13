//
//  StudentGroupViewController.swift
//  kippapp
//
//  Created by Deepak Agarwal on 10/11/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class StudentGroupViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var studentList:[Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.tintColor = UIColor.lightGrayColor()
        tableView.separatorColor = UIColor.darkGrayColor()
        
        tableView.backgroundColor = UIColor.clearColor()
        //UITableViewCellSeparatorStyleNone
        tableView.opaque = true
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        tableView.estimatedRowHeight = 100
        
        tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
        var parseAPI:ParseAPI = (self.tabBarController as KippAppController).parseAPI
        
        self.view.showActivityViewWithLabel("Loading")
        parseAPI.getStudentData("Mia Hamm", grade:"Secondary Intervention") { (students, groups,error) -> () in
            for student in students! {
                self.studentList.append(student)
            }
             self.studentList.sort({$0.name.localizedCaseInsensitiveCompare($1.name) == NSComparisonResult.OrderedAscending})
            self.view.hideActivityView()
            self.tableView.reloadData()
            
        }

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int
    {
        return studentList.count
    }
    
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("GradeViewCell") as GradeViewCell
        
        var checkItem: M13Checkbox = M13Checkbox()
        checkItem.enabled = false
        checkItem.checkState = M13CheckboxStateMixed
        checkItem.strokeColor = UIColor.blackColor()
        checkItem.checkColor = UIColor.blackColor()
        if((indexPath.row % 3) == 0)
        {
            checkItem.checkState = M13CheckboxStateChecked
            checkItem.radius = 5
        }
        else if((indexPath.row % 3) == 1)
        {
            checkItem.checkState = M13CheckboxStateMixed
        }
        else
        {
            checkItem.checkState = M13CheckboxStateUnchecked
        }
        cell.checkBoxContainer.addSubview(checkItem)
        cell.student = studentList[indexPath.row]
        return cell
        
    }
    
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var indexRow = indexPath.row
        var indexSection = indexPath.section
        println("didSelectRowAtIndexPath indexSection = \(indexSection) indexRow = \(indexRow)")
        
        
        
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
