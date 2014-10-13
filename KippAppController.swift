//
//  KippAppController.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/12/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import UIKit

protocol GetParseProtocol : class
{
    func getParseAPI() -> ParseAPI
    
}

class KippAppController: UITabBarController, GetParseProtocol {
    
    var parseAPI:ParseAPI = ParseAPI()

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
    
    func getParseAPI() -> ParseAPI{
        return self.parseAPI
    }

}
