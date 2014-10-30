//
//  LoginViewController.swift
//  kippapp
//
//  Created by isai on 10/11/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    var splashView:CBZSplashView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 14.0
        loginButton.layer.masksToBounds = true

        var imageIcon:UIImage = UIImage(named: "kippicon")
        var bezier:UIBezierPath = UIBezierPath.twitterShape()
        var color:UIColor = UIColor(hexString: "4099FF")
       // var splashView:CBZSplashView = CBZSplashView(bezierPath: bezier, backgroundColor: color)
        var splashView:CBZSplashView = CBZSplashView(icon: imageIcon, backgroundColor: color)
        splashView.animationDuration = 1.4
        self.view.addSubview(splashView)
        self.splashView = splashView
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let delay = 2 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {self.splashView.startAnimation()})
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
