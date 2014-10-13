//
//  StudentAcademicPageViewController.swift
//  kippapp
//
//  Created by isai on 10/11/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class StudentAcademicPageViewController: UIViewController{
    
    var student:Student? = nil

    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var weeklyProgressBar: UIProgressView!
    
    @IBAction func goBack(sender: AnyObject) {
        
      dismissViewControllerAnimated(true, completion: { () -> Void in
       
      })
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        groupLabel.text = student!.groupName
        studentNameLabel.text = student!.name
        weeklyProgressBar.setProgress(student!.progress/100, animated: true)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showPersonal") {
            
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
