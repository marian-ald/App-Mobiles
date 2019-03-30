//
//  VoyageDAO.swift
//  ProjetSwift
//
//  Created by admin on 25/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation
import CoreData

class VoyageDAO {
    
    static let request : NSFetchRequest<Voyage> = Voyage.fetchRequest()
    
    static func save(){
        CoreDataManager.save()
    }
    
    static func delete(voyage: Voyage){
        CoreDataManager.context.delete(voyage)
    }
    
    static func fetchAll() -> [Voyage]?{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return nil
        }
    }
    
    static func fetchByName(name: String) -> [Voyage]?{
        let predicate = NSPredicate(format: "vname == %@", name)
        self.request.predicate = predicate
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
    
    
    
    /*
     static func count(forFirstname firstname: String) -> Int{
     self.request.predicate = NSPredicate(format: "firstname == %@", firstname)
     do{
     return try CoreDataManager.context.count(for: self.request)
     }
     catch let error as NSError{
     fatalError(error.description)
     } }
     static func search(forFirstname firstname: String) -> [Voyage]?{
     self.request.predicate = NSPredicate(format: "firstname == %@", firstname)
     do{
     return try CoreDataManager.context.fetch(request) as [Voyage]
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
     static func search(forLastname lastname: String) -> [Voyage]?{
     self.request.predicate = NSPredicate(format: "lastname == %@", lastname)
     do{
     return try CoreDataManager.context.fetch(request) as [Voyage]
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
     static func search(forFirstname firstname: String, lastname: String) -> [Voyage]?{
     self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@", firstname, lastname)
     do{
     return try CoreDataManager.context.fetch(request) as [Voyage]
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
     static func search(forFirstname firstname: String, lastname: String,  birthdate: Date?) -> Voyage?{
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
     static func count(voyage: Voyage) -> Int{
     if let birthdate = voyage.birthdate{
     self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate == %@",
     voyage.firstname, voyage.lastname, birthdate as CVarArg)
     } else{
     self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate = nil",
     voyage.firstname, voyage.lastname)
     } do{
     return try CoreDataManager.context.count(for: self.request)
     }
     catch let error as NSError{
     fatalError(error.description)
     } }
     static func search(forVoyage voyage: Voyage) -> Voyage?{
     if let birthdate = voyage.birthdate{
     self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate == %@",
     voyage.firstname, voyage.lastname, birthdate as CVarArg)
     } else{
     self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate = nil",
     voyage.firstname, voyage.lastname)
     } do{
     let result = try CoreDataManager.context.fetch(request) as [Voyage]
     guard result.count != 0 else { return nil }
     guard result.count == 1 else { fatalError("duplicate entries") }
     return result[0]
     let result = try CoreDataManager.context.fetch(request) as [Voyage]
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
