//
//  PersonSet.swift
//  Swift02
//
//  Created by Marian Aldescu on 12/03/2019.
//  Copyright © 2019 Aldescu Marian. All rights reserved.
//

import Foundation

class PersonSet {
    
    var persons : [Person]


    typealias Iterator = IndexingIterator<Array<Person>>

    init() {
        self.persons = []
    }    

    init(set : [Person]) {
        self.persons = set
    }
    
    func isEmpty() -> Bool {
        return self.persons.count == 0
    }
    
    func add(p : Person) {
        self.persons.append(p)
    }
    
    /*  Search a person with the same firstName, lastName and birthdate
        and returns its indexOf or nil in case it doesn't exist
    */
    func indexOf(person :Person) -> Int? {
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
        if self.persons.contains(where : { $0.firstName == firstN}) {
            return true 
        }
        return false
    }

    /// Return an array with all the persons with the same
    /// given firstName
    func look(firstN : String) -> [Person] {
        let filtered = self.persons.filter{ $0.firstName == firstN }

        return filtered
    }

    /// Check if a Person with a given lastName exists in the set
    func containsLastName(lastN : String) -> Bool {
        if self.persons.contains(where : { $0.lastName == lastN}) {
            return true 
        }
        return false
    }

    /// Return an array with all the persons with the same
    /// given lastName
    func lookLastName(lastN : String) -> [Person] {
        let filtered = self.persons.filter{ $0.lastName == lastN }

        return filtered
    }

    /// Check if a Person with the same firstName and lastName exists in
    /// the set
    func contains(firstN : String, lastN : String) -> Bool {
        if self.persons.contains(where : { $0.firstName == firstN &&
                $0.lastName == lastN}) {
            return true 
        }
        return false
    }

    /// Return an array with all the persons with the same
    /// given firstName and lastName
    func look(firstN : String, lastN : String) -> [Person] {
        let filtered = self.persons.filter{
            $0.firstName == firstN &&
            $0.lastName == lastN
        }

        return filtered
    }

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

    func look(firstN : String, lastN : String, bDate : Date?) -> Person? {
        //if let bDate1 = bDate {
        let pers : Person = Person.init(lastN : lastN, firstN : firstN)
        //if let indexOf = self.indexOf(Person)
        pers.birthDate = bDate
        //}

        if let indexOf = self.indexOf(person : pers) {
            return self.persons[indexOf]
        }

        return nil
    }

    func makeIterator() -> ItPersonSet {
        let it = ItPersonSet.init(set: self)
        return it
    }
}
