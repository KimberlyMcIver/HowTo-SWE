//
//  UserModel.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 12/12/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

class UserModel {
    
    var firstName: String?
    var lastName: String?
    var schoolOccupation: String?
    var location: String?
    var skills: String?
    var desiredSkills: String?
    var mentorOrMentee: String?
    
    init(firstName: String?, lastName: String?, schoolOccupation: String?, location: String?, skills: String?, desiredSkills: String?, mentorOrMentee: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.schoolOccupation = schoolOccupation
        self.location = location
        self.skills = skills
        self.desiredSkills = desiredSkills
        self.mentorOrMentee = mentorOrMentee
    }
    
}
