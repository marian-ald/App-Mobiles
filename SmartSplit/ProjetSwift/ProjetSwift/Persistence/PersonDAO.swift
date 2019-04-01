//
//  PersonDAO.swift
//  ProjetSwift
//
//  Created by admin on 25/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation
import CoreData

class PersonDAO {
    
    static let request : NSFetchRequest<Person> = Person.fetchRequest()
    
    static func save(){
        CoreDataManager.save()
    }
    
    static func delete(person: Person){
        CoreDataManager.context.delete(person)
    }
    
    static func fetchAll() -> [Person]?{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return nil
        }
    }
    
    
    /// number of elements
    static var count: Int{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        }
    }
    
    static func fetchByVoyage(forVoyageName vname : String) -> [Person]? {
        print("I searched for a voyage with :")
        print(vname)
        self.request.predicate = NSPredicate(format: "voyage.vname == %@")
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        }
    }
    
    /*
    
    static func count(forFirstname firstname: String) -> Int{
        self.request.predicate = NSPredicate(format: "firstname == %@", firstname)
        do{
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        } }
    static func search(forFirstname firstname: String) -> [Person]?{
        self.request.predicate = NSPredicate(format: "firstname == %@", firstname)
        do{
            return try CoreDataManager.context.fetch(request) as [Person]
        }
        catch{
            return nil
        } }
    static func count (forLastname lastname: String) -> Int{
        self.request.predicate = NSPredicate(format: "lastname == %@", lastname)
        do{
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        } }
    static func search(forLastname lastname: String) -> [Person]?{
        self.request.predicate = NSPredicate(format: "lastname == %@", lastname)
        do{
            return try CoreDataManager.context.fetch(request) as [Person]
        }
        catch{
            return nil
        } }
    static func count(forFirstname firstname: String, lastname: String) -> Int{
        self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@", firstname, lastname)
        do{
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        }
    }
    static func search(forFirstname firstname: String, lastname: String) -> [Person]?{
        self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@", firstname, lastname)
        do{
            return try CoreDataManager.context.fetch(request) as [Person]
        }
        catch{
            return nil
        } }
    static func count(forFirstname firstname: String, lastname: String,  birthdate: Date?) -> Int{
        if let birthdate = birthdate{
            self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate == %@",
                                                 firstname, lastname, birthdate as CVarArg)
        } else{
            self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate = nil",
                                                 firstname, lastname)
        }
        do {
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        } }
    
    /*
    static func search(forFirstname firstname: String, lastname: String,  birthdate: Date?) -> Person?{
        if let birthdate = birthdate{
            self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate == %@",
                                                 firstname, lastname, birthdate as CVarArg)
        } else{
            self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate = nil",
                                                 firstname, lastname)
        } do{
        } catch{
            return nil
        } }
    static func count(person: Person) -> Int{
        if let birthdate = person.birthdate{
            self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate == %@",
                                                 person.firstname, person.lastname, birthdate as CVarArg)
        } else{
            self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate = nil",
                                                 person.firstname, person.lastname)
        } do{
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        } }
    static func search(forPerson person: Person) -> Person?{
        if let birthdate = person.birthdate{
            self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate == %@",
                                                 person.firstname, person.lastname, birthdate as CVarArg)
        } else{
            self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate = nil",
                                                 person.firstname, person.lastname)
        } do{
            let result = try CoreDataManager.context.fetch(request) as [Person]
            guard result.count != 0 else { return nil }
            guard result.count == 1 else { fatalError("duplicate entries") }
            return result[0]
            let result = try CoreDataManager.context.fetch(request) as [Person]
            guard result.count != 0 else { return nil }
            guard result.count == 1 else { fatalError("duplicate entries") }
            
            return result[0]
        }
        catch{
            return nil
        } }
  */
 */
}
