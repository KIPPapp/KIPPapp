//
//  Student.swift
//  kippapp
//
//  Created by isai on 10/12/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import Foundation

class Student
{
    var name: String?
    var id: NSNumber
    var subjects: [Subject]?
    var groups: [Group]?
    var teacher: Teacher?
    
    init(name: String?, id: NSNumber?)
    {
        self.name = name
        self.id = id!
        
        //willSet
    }
    
    func assignGroupForWeek()
    {
        
    }
    
    func getGroups()
    {
        
    }
    
    func assignParent()
    {
        
    }
    
    func getParent()
    {
        
    }
    
    func getSubjects()
    {
        
    }
    
}