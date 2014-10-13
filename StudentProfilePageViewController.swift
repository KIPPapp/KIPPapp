//
//  StudentProfilePageViewController.swift
//  kippapp
//
//  Created by isai on 10/11/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class StudentProfilePageViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentIDLabel: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBAction func onPhoneButtonClicked(sender: UIButton) {
        
        let phoneText = sender.currentTitle as String?
        println("Dialing \(phoneText)...")
    UIApplication.sharedApplication().openURL(NSURL.URLWithString(phoneText!))
 
    }
    
    @IBAction func onEmailButtonClicked(sender: UIButton) {
        
        let emailText = sender.currentTitle as String?
        println("Opening mail application...")
    UIApplication.sharedApplication().openURL(NSURL.URLWithString(emailText!))
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
