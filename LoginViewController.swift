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
        loginButton.layer.cornerRadius = 14.0
        loginButton.layer.masksToBounds = true

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var loginButton: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showHome(sender: AnyObject) {
        //if (self.usernameLabel.text == "mia.hamm" && self.passwordLabel.text == "12345") {
        
            self.performSegueWithIdentifier("showHome", sender: self)
       // }
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
