//
//  Teacher.swift
//  kippapp
//
//  Created by isai on 10/12/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import Foundation

class Teacher
{
    var name: String?
    var login: String?
    var password: String?
    var students: [Student]?
    var groups: [Group]?
    var subjects: [Subject]?
    
    
    init(name: String?, login: String?, password: String?)
    {
        self.name = name
        self.login = login
        self.password = password
    }
    
}