//
//  AssocDepensePersonDAO.swift
//  ProjetSwift
//
//  Created by user152227 on 4/2/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit
import CoreData

class AssocDepensePersonDAO: NSObject {
    
    static let request : NSFetchRequest<AssociationDepensePayer> = AssociationDepensePayer.fetchRequest()
    
    static func save(){
        CoreDataManager.save()
    }
    
    static func delete(assoc: AssociationDepensePayer){
        CoreDataManager.context.delete(assoc)
    }
    
    static func fetchAll() -> [AssociationDepensePayer]?{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return nil
        }
    }
    
    
    static func fetchByDepenseName(nameDepense : String) -> [AssociationDepensePayer]? {
        self.request.predicate = NSPredicate(format: "nameDepense == %@", nameDepense)
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        }
    }
    
}
