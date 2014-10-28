//
//  NotesViewController.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/25/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
  
    var notes:[[String:String]] = [["note":"Need to verify that student finished quiz.","date":"10/17/2014"],
        ["note":"Student scored less than %50 on post -quiz. Have student raise speak with you before they take next post-quiz","date":"10/15/2014"],
        ["note":"Topic specific intervention - use game maps if helpful","date":"10/13/2014"],
       [ "note":"Needs help with translating conceptual mastery to traditional application","date":"10/12/2014"]]
       

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
        self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController", bundle: nil)
        self.popViewController.title = "This is a popup view"

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createNew(sender: AnyObject) {
        
             self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController", bundle: nil)
            self.popViewController.showInView(self.tableView, withImage: UIImage(named: "typpzDemo"), withMessage: "Note... ", animated: true)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
   
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
         self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController", bundle: nil)
         self.popViewController.showInView(self.tableView, withImage: UIImage(named: "typpzDemo"), withMessage: notes[indexPath.row]["note"], animated: true)
        return indexPath
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("NotesCell", forIndexPath: indexPath) as NotesViewCell
    //    cell.layer.cornerRadius = 25.0
      //  cell.layer.masksToBounds = true
       
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        cell.notesText.text = notes[indexPath.row]["note"]
        cell.notesDate.text = notes[indexPath.row]["date"]
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
