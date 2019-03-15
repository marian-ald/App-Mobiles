//
//  ItPersonSet.swift
//  Pers
//
//  Created by Marian ALDESCU on 14/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation


class ItPersonSet: IteratorProtocol {
    var perSet: PersonSet
    var index: Int
    
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
