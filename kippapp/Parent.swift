//
//  Parent.swift
//  kippapp
//
//  Created by isai on 10/12/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import Foundation

class Parent
{
    var name: String?
    var emailID: String?
    var contact: NSNumber?
    var child: [Student]?

    init(name: String?,emailID: String?, contact: NSNumber?, child: Student)
    {
        self.name = name
        self.emailID = emailID
        self.contact = contact
    }
    
}