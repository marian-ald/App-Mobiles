//
//  DepenseForVoyageFetchResultController.swift
//  ProjetSwift
//
//  Created by user152227 on 4/1/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit
import CoreData


class DepenseForVoyageFetchResultController: NSObject, NSFetchedResultsControllerDelegate{
    
    let tableView  : UITableView
    
    init(view : UITableView){
        self.tableView  = view
        super.init()
        do{
            try self.depensesFetched.performFetch()
        }
        catch let error as NSError{
            fatalError(error.description)
        }
        
    }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: - FetchResultController
    lazy var depensesFetched : NSFetchedResultsController<Depense> = {
        
        // i need the pfirstname and plastname of all participants of all current voyage
        /*
        let fetchRequest : NSFetchRequest<Person> = Person.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key:#keyPath(Person.pfirstname),ascending:true)]
        
        do{
            let items = try CoreDataManager.context.execute(fetchRequest)
            print(items.
        }
        catch{}*/
        
        let moc = CoreDataManager.context;
        let personsFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        personsFetch.predicate = NSPredicate(format: "participate.vname == %@", SingletonStore.shared.currentVoyage!.name)
        
        var firstNamesOfParticipants : [String] = []
        var lastNamesOfParticipants : [String] = []
        
        do {
            let fetchedPersons = try moc.fetch(personsFetch) as! [Person]
            for personResulted in fetchedPersons {
                firstNamesOfParticipants.append(personResulted.firstname)
                lastNamesOfParticipants.append(personResulted.lastname)
            }
        }
        catch{
            print("oopsie error!!")
        }
        
        
        // prepare a request
        let request : NSFetchRequest<Depense> = Depense.fetchRequest()
        request.predicate = NSPredicate(format: "any paidBy.pfirstname in %@ and any paidBy.plastname in %@", firstNamesOfParticipants, lastNamesOfParticipants) //asta va merge dupa ce voi si crea relatiile :)
        
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Depense.nameDepense),ascending:true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext:
            CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        return fetchResultController
    }()
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>){
        self.tableView.beginUpdates()
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>){
        self.tableView.endUpdates()
        CoreDataManager.save()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at
        indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath{
                self.tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath{
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath{
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            } default:
            break
        } }
}


