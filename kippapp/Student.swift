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
    var name: String = ""
    var id: String = ""
    var grade: String = ""
    var teacher: String = ""
    var mastery: Float = 0.0
    var progress: Float = 0.0
    var currentNumTries: Int = 0
    var groupName: String = ""
    var homeLogins: Int = 0
    var labLogins: Int = 0
    var minLastWeek: Int = 0
    var imagePath:String = "monika_square.png"
    var attendance:String = "notset"
    
    var subjects: [Subject]?
    var groups: [Group]?
    
    
    init()
    {
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