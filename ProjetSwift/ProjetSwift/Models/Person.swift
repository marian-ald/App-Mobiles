//
//  Person.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 28/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation


import CoreData

extension Person {
    
    // MARK: -
    /*
     /// firstname of Person
     let pfirstname : String
     
     /// lastname of Person
     let plastname  : String
     
     /// start date of a person
     var pstartDate : Date
     
     /// end date of a person
     var pstopDate : Date
     
     /// path of the image of the person
     var pimage : String?
     */
    
    var firstname : String{
        get { return self.pfirstname ?? "" }
        set { self.pfirstname = newValue }
    }
    
    var lastname : String{
        get { return self.plastname ?? "" }
        set { self.plastname = newValue }
    }
    
    /// full name of a person
    var fullname: String {
        return self.firstname + " " + self.lastname
    }
    
    
    /// initialize a `Person`
    ///
    /// - Parameters:
    ///   - firstname: `String` first name of `Person`
    ///   - lastname:  `String` last name of `Person`
    convenience init(firstname: String, lastname: String, startDate: Date, stopDate: Date){
        self.init(context: CoreDataManager.context)
        self.pfirstname = firstname
        self.lastname  = lastname
        self.pstartDate = startDate
        self.pstopDate = stopDate
    }
    
    /// initialize a `Person`
    ///
    /// - Parameters:
    ///   - firstname: `String` first name of `Person`
    ///   - lastname:  `String` last name of `Person`
    convenience init(firstname: String, lastname: String, startDate: Date, stopDate: Date, image: String){
        self.init(context: CoreDataManager.context)
        self.pfirstname = firstname
        self.plastname  = lastname
        self.pstartDate = startDate
        self.pstopDate = stopDate
        // self.pimage = image
    }
}

/* MARK: -
 extension Person : Equatable{
 static func ==(lhs: Person, rhs: Person) -> Bool {
 return (lhs.firstname == rhs.firstname) && (lhs.lastname == rhs.lastname)
 }
 
 static func != (lhs: Person, rhs: Person) -> Bool {
 return !(lhs == rhs)
 }
 
 }*/
