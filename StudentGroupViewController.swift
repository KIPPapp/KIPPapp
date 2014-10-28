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
    var groupName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = groupName
        tableView.dataSource = self
        tableView.delegate = self

        tableView.opaque = true
      /*  tableView.separatorInset = UIEdgeInsetsMake (0, 15, 0,0);
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension*/
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int
    {
        return studentList.count
        //return 0
    }
    
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
    var cell = tableView.dequeueReusableCellWithIdentifier("GroupStudentViewCell") as GroupStudentViewCell

    cell.nameLabel.text = self.studentList[indexPath.row].name
    cell.profileView.layer.masksToBounds = false
    cell.profileView.clipsToBounds = true
    cell.profileView.layer.cornerRadius = 50
    cell.profileView.image = UIImage(named:self.studentList[indexPath.row].imagePath)
        return cell 
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var indexRow = indexPath.row
        var indexSection = indexPath.section
        println("didSelectRowAtIndexPath indexSection = \(indexSection) indexRow = \(indexRow)")
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showProfile") {
            
            var indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            let student = studentList[indexPath.row]
            
            let navigationController = segue.destinationViewController as UINavigationController
            let detailViewController = navigationController.viewControllers[0] as StudentProfilePageViewController
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
