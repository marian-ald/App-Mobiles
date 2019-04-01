//
//  TransferDAO.swift
//  ProjetSwift
//
//  Created by user151921 on 4/1/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation
import CoreData

class TransferDAO {
    
    static let request : NSFetchRequest<Transfer> = Transfer.fetchRequest()
    
    static func save(){
        CoreDataManager.save()
    }
    
    static func delete(transfer: Transfer){
        CoreDataManager.context.delete(transfer)
    }
    
    static func fetchAll() -> [Transfer]?{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return nil
        }
    }
    
    static func fetchByName(name: String) -> [Transfer]?{
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
     static func search(forFirstname firstname: String) -> [Transfer]?{
     self.request.predicate = NSPredicate(format: "firstname == %@", firstname)
     do{
     return try CoreDataManager.context.fetch(request) as [Transfer]
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
     static func search(forLastname lastname: String) -> [Transfer]?{
     self.request.predicate = NSPredicate(format: "lastname == %@", lastname)
     do{
     return try CoreDataManager.context.fetch(request) as [Transfer]
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
     static func search(forFirstname firstname: String, lastname: String) -> [Transfer]?{
     self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@", firstname, lastname)
     do{
     return try CoreDataManager.context.fetch(request) as [Transfer]
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
     static func search(forFirstname firstname: String, lastname: String,  birthdate: Date?) -> Transfer?{
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
     static func count(transfer: Transfer) -> Int{
     if let birthdate = transfer.birthdate{
     self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate == %@",
     transfer.firstname, transfer.lastname, birthdate as CVarArg)
     } else{
     self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate = nil",
     transfer.firstname, transfer.lastname)
     } do{
     return try CoreDataManager.context.count(for: self.request)
     }
     catch let error as NSError{
     fatalError(error.description)
     } }
     static func search(forTransfer transfer: Transfer) -> Transfer?{
     if let birthdate = transfer.birthdate{
     self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate == %@",
     transfer.firstname, transfer.lastname, birthdate as CVarArg)
     } else{
     self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate = nil",
     transfer.firstname, transfer.lastname)
     } do{
     let result = try CoreDataManager.context.fetch(request) as [Transfer]
     guard result.count != 0 else { return nil }
     guard result.count == 1 else { fatalError("duplicate entries") }
     return result[0]
     let result = try CoreDataManager.context.fetch(request) as [Transfer]
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
