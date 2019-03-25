//
//  PersonSet.swift
//  Pers
//
//  Created by Marian ALDESCU on 14/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

class PersonSet {
    
    fileprivate var persons : [Person]

    init() {
        self.persons = []
    }
    
    init(set : [Person]) {
        self.persons = set
    }
    
    func isEmpty() -> Bool {
        return self.persons.count == 0
    }
    
    func add(person : Person) {
        self.persons.append(person)
    }
    
    /*  Search a person with the same firstName and lastName
     and returns its indexOf or nil in case it doesn't exist
     */
    func indexOf(person :Person) -> Int? {
        for i in 0...self.persons.count {
            if self.persons[i].pfirstname == person.pfirstname &&
                self.persons[i].plastname == person.plastname {
                    return i
                }
        }
        return nil
    }
    
    func remove(p : Person) {
        if let indexOf = self.indexOf(person : p) {
            self.persons.remove(at: indexOf)
        }
    }
    
    func count() -> Int {
        return self.persons.count
    }
    
    func contains(p : Person) -> Bool {
        if let _ = self.indexOf(person : p) {
            return true
        }
        return false
    }
    
    func look(p : Person) -> Person? {
        if let indexOf = self.indexOf(person : p) {
            return self.persons[indexOf]
        }
        return nil
    }
    
    /// Check if a Person with a given firstName exists in the set
    func contains(firstN : String) -> Bool {
        if self.persons.contains(where : { $0.pfirstname == firstN}) {
            return true
        }
        return false
    }
    
    /// Return an array with all the persons with the same
    /// given firstName
    func look(firstN : String) -> [Person] {
        let filtered = self.persons.filter{ $0.pfirstname == firstN }
        
        return filtered
    }
    
    /// Check if a Person with a given lastName exists in the set
    func containsLastName(lastN : String) -> Bool {
        if self.persons.contains(where : { $0.plastname == lastN}) {
            return true
        }
        return false
    }
    
    /// Return an array with all the persons with the same
    /// given lastName
    func lookLastName(lastN : String) -> [Person] {
        let filtered = self.persons.filter{ $0.plastname == lastN }
        
        return filtered
    }
    
    /// Check if a Person with the same firstName and lastName exists in
    /// the set
    func contains(firstN : String, lastN : String) -> Bool {
        if self.persons.contains(where : { $0.pfirstname == firstN &&
            $0.plastname == lastN}) {
            return true
        }
        return false
    }
    
    /// Return an array with all the persons with the same
    /// given firstName and lastName
    func look(firstN : String, lastN : String) -> [Person] {
        let filtered = self.persons.filter{
            $0.pfirstname == firstN &&
                $0.plastname == lastN
        }
        
        return filtered
    }
    
/*
    /// Check if a Person with the same firstName, lastName and
    /// birthdate exists in the set
    func contains(firstN : String, lastN : String, bDate : Date) -> Bool {
        let filtered = self.persons.filter{
            $0.birthDate != nil
        }
        
        if filtered.contains(where : {
            $0.firstName == firstN &&
                $0.lastName == lastN &&
                $0.birthDate == bDate}) {
            return true
        }
        return false
    }
 */
/*
    func look(firstN : String, lastN : String, bDate : Date?) -> Person? {
        let pers : Person = Person.init(lastN : lastN, firstN : firstN)
        pers.birthDate = bDate

        if let indexOf = self.indexOf(person : pers) {
            return self.persons[indexOf]
        }
        
        return nil
    }
    
    func makeIterator() -> ItPersonSet {
        let it = ItPersonSet.init(set: self)
        return it
    }
*/
}

class ItPersonSet: IteratorProtocol {
    private var perSet: PersonSet
    private var index: Int
    
    init(set : PersonSet) {
        self.perSet = set
        self.index = 0
    }
    
    func reset() {
        self.index = 0
    }
    
    func next() -> Person? {
        if index < self.perSet.count() {
            let aux : Int = self.index
            self.index += 1
            return self.perSet.persons[aux]
        }
        return nil
    }
    
    func current() -> Person? {
        if index < self.perSet.count() {
            return self.perSet.persons[self.index]
        }
        return nil
    }
    
    func end() -> Bool {
        if self.index == self.perSet.count() {
            return true
        }
        return false
    }
}
