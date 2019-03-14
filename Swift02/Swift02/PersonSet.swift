//
//  PersonSet.swift
//  Swift02
//
//  Created by Theodora-Augustina DRAGAN on 12/03/2019.
//  Copyright © 2019 Aldescu Marian. All rights reserved.
//

import Foundation

class PersonSet {
    
    var persons : [Person] = []

    
    
    init(set : [Person]) {
        self.persons = set
    }
    
    func isEmpty() -> Bool {
        return self.persons.isEmpty
    }
    
    func add(p : Person) {
        self.persons.append(p)
    }
    
    /*  Search a person with the same firstName, lastName and birthdate
        and returns its position or nil in case it doesn't exist
    */
    func position(person :Person) -> Int? {
        if let date1 = person.birthdate() {
            for i in 0...self.persons.count {
                if let date2 = self.persons[i].birthdate() {
                    if self.persons[i].firstName == person.firstName && 
                        self.persons[i].lastName == person.lastName &&
                        date1 == date2 {
                            return i
                    }
                }
            }
        }
        return nil
    }

    func remove(p : Person) {
        if let position = self.position(person : p) {
            self.persons.remove(at: position)
        }
    }
    
    func count() -> Int {
        return self.persons.count
    }
    
    func contains(p : Person) -> Bool {
        if let _ = self.position(person : p) {
            return true
        }
        return false
    }

    func look(p : Person) -> Person? {
        if let position = self.position(person : p) {
            return self.persons[position]
        }
        return nil
    }    
    
}
