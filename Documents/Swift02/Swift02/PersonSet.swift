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
    
    func remove(p : Person) {
        for index in 0..self.persons.count {
            
        }
    }
    
    
    
    
}
