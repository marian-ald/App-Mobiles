//
//  AssociationDepensePerson.swift
//  ProjetSwift
//
//  Created by user152227 on 3/31/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

extension AssociationDepensePayer {
    
    var nameD : String {
        get { return self.nameDepense ?? "" }
        set { self.nameDepense = newValue }
    }
    
    var firstnameP : String {
        get { return self.firstnamePayer ?? "" }
        set { self.firstnamePayer = newValue }
    }
    
    var lastnameP : String {
        get { return self.lastnamePayer ?? "" }
        set { self.lastnamePayer = newValue }
    }
    
    var fullnameP : String {
        get { return self.firstnameP + " " + self.lastnameP }
    }
    
    var sum : Float {
        get { return self.sumPaid }
        set { self.sumPaid = newValue }
    }
    
    convenience init(nameD : String, firstnameP: String, lastnameP : String, sum: Float){
        self.init(context: CoreDataManager.context)
        self.nameD = nameD
        self.firstnameP = firstnameP
        self.lastnameP = lastnameP
        self.sum = sum
    }
    
}

