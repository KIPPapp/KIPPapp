//
//  GroupController.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/11/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class GroupController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var groups:[String] = []
    var students:[Student] = []
    var studentList:[Student] = []
    
    let headers =
    ["Operations and Algebraic Thinking",
        "Complex Number Systems",
        "Geometry",
        "Statistics and probability"] as NSArray
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.showActivityViewWithLabel("Loading")
        
        //Get topics
        var parseAPI:ParseAPI = (self.tabBarController as KippAppController).parseAPI
        parseAPI.getStudentData("Mia Hamm", grade:"Secondary Intervention") { (students, groups, error) -> () in
            for group in groups! {
                self.groups.append(group)
            }
            self.groups.sort({$0.localizedCaseInsensitiveCompare($1) == NSComparisonResult.OrderedAscending})
            self.students = students!
            self.view.hideActivityView()
            self.tableView.reloadData()
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return headers.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count/headers.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("GroupCell") as GroupCell
        cell.group = self.groups[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        headerLabel.text = self.headers[section] as? String
        
        var headerText = self.headers[section] as NSString
        return headerText
    }
    /*
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    var headerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
    headerView.backgroundColor = UIColor(red: 14.0/255.0, green: 114.0/255.0, blue: 199.0/255.0, alpha: 0.75)
    var headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
    headerLabel.text = self.headers[section] as? String
    
    headerView.addSubview(headerLabel)
    return headerView
    }*/
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  /*      if (segue.identifier == "showMembers") {
            
            var indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            let groupName = groups[indexPath.row]
            // find the students belonging to this group
            var studentList:[Student] = []
            for student in self.students {
                if (student.groupName == groupName) {
                    studentList.append(student)
                }
            }
            
            let navigationController = segue.destinationViewController as UINavigationController
            let detailViewController = navigationController.viewControllers[0] as StudentMasterViewController
            detailViewController.studentList = studentList
            
        } */
        
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
