//
//  DepenseDAO.swift
//  ProjetSwift
//
//  Created by user152227 on 4/2/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation
import CoreData

class DepenseDAO {
    
    static let request : NSFetchRequest<Depense> = Depense.fetchRequest()
    
    static func save(){
        CoreDataManager.save()
    }
    
    static func delete(depense: Depense){
        CoreDataManager.context.delete(depense)
    }
    
    static func fetchAll() -> [Depense]?{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return nil
        }
    }
    
    static func fetchByName(nameDepense: String) -> [Depense]?{
        let predicate = NSPredicate(format: "nameDepense == %@", nameDepense)
        self.request.predicate = predicate
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return nil
        }
    }
    
}
