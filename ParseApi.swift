//
//  ParseApi.swift
//  kippapp
//
//  Created by Monika Gorkani on 10/12/14.
//  Copyright (c) 2014 kippgroup. All rights reserved.
//

import Foundation

class ParseAPI {
    
    init() {
        
    }
    
    var students: [Student] = []
    var groups: [String] = []
    
    

    func getStudentData(teacher:String,grade:String,completion: (students: [Student]?, groups:[String]?,error: NSError?) -> ()) {
        var query = PFQuery(className:"StudentStats")
        query.whereKey("Teacher", equalTo:teacher)
        query.whereKey("Grade", equalTo:grade)
        
        
        if (!students.isEmpty) {
            completion(students: students, groups: groups,error: nil)
        }
        else {
    
            var query = PFQuery(className:"StudentStats")
            query.whereKey("Teacher", equalTo:teacher)
            query.whereKey("Grade", equalTo:grade)
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]!, error: NSError!) -> Void in
                if error == nil {
                    // The find succeeded.
                    NSLog("Successfully retrieved \(objects.count) Student Stats.")
                    // Do something with the found objects
                    var index:Int = 1
                    for object in objects {
                   
                        var student:Student = Student()
                        student.name = object["Student"] as String
                        student.id = object["studentId"] as String
                        student.groupName = object["currentObjective"] as String
                        student.homeLogins = (object["homeLogins"] as String).toInt()!
                        student.labLogins = (object["labLogins"] as String).toInt()!
                        student.mastery = (object["Mastery"] as NSString).floatValue
                        student.progress = (object["Progress"] as NSString).floatValue
                        student.grade = object["Grade"] as String
                        student.teacher = object["Teacher"] as String
                        student.currentNumTries = (object["currentNumTries"] as String).toInt()!
                        student.imagePath = "\(index.description).png"
                        index=index+1
                        student.minLastWeek = (object["minLastWeek"] as String).toInt()!
                        self.students.append(student)
                        if (!contains(self.groups,student.groupName)) {
                            self.groups.append(student.groupName)
                        }
                    
                    }
                    completion(students: self.students,groups: self.groups, error:nil)
                } else {
                    // Log details of the failure
                    NSLog("Error: %@ %@", error, error.userInfo!)
                    completion(students:nil, groups: nil, error:error)
                }
            }
        }
    
    }
}
