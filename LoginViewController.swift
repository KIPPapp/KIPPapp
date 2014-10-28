//
//  LoginViewController.swift
//  kippapp
//
//  Created by isai on 10/11/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showHome(sender: AnyObject) {
        //if (self.usernameLabel.text == "mia.hamm" && self.passwordLabel.text == "12345") {
        
            self.performSegueWithIdentifier("showHome", sender: self)
       // }
    }
    @IBOutlet weak var passwordLabel: UITextField!

    @IBOutlet weak var usernameLabel: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
