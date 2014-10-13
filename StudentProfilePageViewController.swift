//
//  StudentProfilePageViewController.swift
//  kippapp
//
//  Created by isai on 10/11/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class StudentProfilePageViewController: UIViewController {

    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
        
        })
    }
    
    @IBOutlet weak var phoneButton: UILabel!
    var student:Student? = nil
    
    @IBOutlet weak var emailButton: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentIDLabel: UILabel!
   
    
    override func viewWillAppear(animated: Bool) {
        studentNameLabel.text = student!.name
        studentIDLabel.text = "Student ID: \(student!.id)"
        
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
