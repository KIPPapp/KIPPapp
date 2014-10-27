//
//  NotesViewController.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/25/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
  
    var notes:[[String:String]] = [["note":"this is cool","date":"10/14/2014"]]
       

     var popViewController : PopUpViewControllerSwift!
    
    @IBAction func goBack(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = UITableViewAutomaticDimension
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createNew(sender: AnyObject) {
        
  //       performSegueWithIdentifier("showDetailNote", sender: self)
        
 /*       if (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
        {
            self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPad", bundle: nil)
            self.popViewController.title = "This is a popup view"
            self.popViewController.showInView(self.view, withImage: UIImage(named: "typpzDemo"), withMessage: "You just triggered a great popup window", animated: true)
        } else
        { */
            self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController", bundle: nil)
            self.popViewController.title = "This is a popup view"
            self.popViewController.showInView(self.view, withImage: UIImage(named: "typpzDemo"), withMessage: "Note... ", animated: true)
  //      }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        performSegueWithIdentifier("showDetailNote", sender: self)
        return indexPath
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("NotesCell", forIndexPath: indexPath) as NotesViewCell
    //    cell.layer.cornerRadius = 25.0
      //  cell.layer.masksToBounds = true
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        
     //   cell.layer.borderWidth = 1.0
        return cell;
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
