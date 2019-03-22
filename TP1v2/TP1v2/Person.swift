//
//  Person.swift
//  Pers
//
//  Created by Marian ALDESCU on 14/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

class Person {
    var lastName : String
    var firstName : String
    var startDate : Date
    var stopDate : Date

    init(lastN : String, firstN : String, startDate: Date, stopDate : Date) {
        self.firstName = firstN
        self.lastName = lastN
        self.startDate = startDate
        self.stopDate = stopDate
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

    static func ==(p1 : Person, p2 : Person) -> Bool {
        return p1.firstname() == p2.firstName && p1.lastname() == p2.lastname()
    }
    
    static func !=(p1 : Person, p2 : Person) -> Bool {
        return !(p1 == p2)
    }
}
