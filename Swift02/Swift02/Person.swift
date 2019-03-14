//
//  Person.swift
//  Swift02
//
//  Created by Marian Aldescu on 12/03/2019.
//  Copyright © 2019 Aldescu Marian. All rights reserved.
//

import Foundation

class Person {
    var lastName : String = ""
    var firstName : String = ""
    var birthDate : Date?
    var age_person : Int?
    
    init(lastN : String, firstN : String) {
        self.firstName = lastN
        self.lastName = firstN
        self.birthDate = nil
        self.age_person = 0
    }
    
    func lastname() -> String {
        return self.lastName
    }
    
    func firstname() -> String {
        return self.firstName
    }
    
    func fullname() -> String {
        return self.firstName + " " + self.lastName
    }
    
    func birthdate() -> Date? {
        return self.birthDate
    }

    func birthdate(bDate : Date) {
        self.birthDate = bDate
    }
    
    func age() -> Int? {
        return self.age_person
    }
    
    static func ==(p1 : Person, p2 : Person) -> Bool {
        if let d1 = p1.birthdate(), let d2 = p2.birthdate() {
            return p1.firstname() == p2.firstName && p1.lastname() == p2.lastname() && d1 == d2
        }
        return false
    }
    
    static func !=(p1 : Person, p2 : Person) -> Bool {
        return !(p1 == p2)
    }

}
