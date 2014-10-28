//
//  GroupController.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/11/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class GroupController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var groups: [String] = []
    var studentGroups: Dictionary<Int, [String]> = Dictionary<Int, [String]>()
    var students:[Student] = []
    var studentList:[Student] = []
    
    let headers =
    ["  Operations and Algebraic Thinking",
        "  Complex Number Systems",
        "  Geometry",
        "  Statistics and probability"] as NSArray

    let colors =
    [ UIColor(red: 113/255, green: 169/255, blue: 219/255, alpha: 1.0),
      UIColor(red: 247/255, green: 174/255, blue: 90/255, alpha: 1.0),
      UIColor(red: 113/255, green: 169/255, blue: 219/255, alpha: 1.0),
      UIColor(red: 247/255, green: 174/255, blue: 90/255, alpha: 1.0)
    ] as NSArray
    
    
    func splitStudentsToGroups(studentInGroups: [String])
    {
        var countInEachGroup = studentInGroups.count/4
        var index_begin = 0 as Int
        var group_index = 0 as Int
        var index_end = countInEachGroup as Int
        
        while(index_end <= studentInGroups.count)
        {
            var temp: [String] = []
            while(index_begin <= index_end-1)
            {
                temp.append(studentInGroups[index_begin])
                index_begin += 1
            }
            self.studentGroups[group_index] = temp
            temp.removeAll(keepCapacity: false)
            group_index += 1
            index_end += countInEachGroup
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.opaque = true
        tableView.backgroundColor = UIColor(red: 239/255, green: 248/255, blue: 255/255, alpha: 1.0)
        tableView.separatorInset = UIEdgeInsetsMake (0, 15, 0,0);
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
    self.view.showActivityViewWithLabel("Loading")
        //Get topics
        var parseAPI:ParseAPI = (self.tabBarController as KippAppController).parseAPI
        parseAPI.getStudentData("Mia Hamm", grade:"Secondary Intervention") { (students, groups, error) -> () in
            for group in groups! {
                self.groups.append(group)
            }
            self.groups.sort({$0.localizedCaseInsensitiveCompare($1) == NSComparisonResult.OrderedAscending})
            self.splitStudentsToGroups(self.groups)
            self.students = students!
            self.view.hideActivityView()
            self.tableView.reloadData()
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return headers.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentGroups.count - 1
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("GroupCell") as GroupCell
        
        var groupNames = self.studentGroups[indexPath.section] as Array!
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.groupName.text = groupNames[indexPath.row]
        cell.backgroundColor = colors[indexPath.section] as? UIColor
        return cell
    }
    
   func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headerText = self.headers[section] as NSString
        return headerText
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        var headerLabel = UILabel()
        headerLabel.font.fontWithSize(25)
        headerLabel.text = self.headers[section] as NSString
        headerLabel.textAlignment = NSTextAlignment.Natural
        headerLabel.textColor = UIColor(red: 59/255, green: 98/255, blue: 157/255, alpha: 1.0)
        return headerLabel
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let groupName = groups[indexPath.row]
        // find the students belonging to this group
        var studentList:[Student] = []
        for student in self.students {
            if (student.groupName == groupName) {
                studentList.append(student)
            }
        }
        performSegueWithIdentifier("showMembers", sender: studentList)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showMembers") {

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
            let detailViewController = navigationController.viewControllers[0] as StudentGroupViewController
            detailViewController.studentList = studentList
            
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
