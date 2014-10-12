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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int
    {
        return 7
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
        return cell
        
    }
    
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var indexRow = indexPath.row
        var indexSection = indexPath.section
        println("didSelectRowAtIndexPath indexSection = \(indexSection) indexRow = \(indexRow)")
        
        
        
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
