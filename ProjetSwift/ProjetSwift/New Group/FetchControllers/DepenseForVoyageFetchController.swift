//
//  DepenseForVoyageFetchController.swift
//  ProjetSwift
//
//  Created by user152227 on 4/1/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit
import CoreData

class DepenseForVoyageFetchController: NSObject, NSFetchedResultsControllerDelegate{
    
    let tableView  : UITableView
    
    init(view : UITableView){
        self.tableView  = view
        super.init()
        do{
            try self.depensesFetched.performFetch()
        }
        catch let error as NSError{
            fatalError(error.description)
        } }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: - FetchResultController
    lazy var depensesFetched : NSFetchedResultsController<Depense> = {
        
        // first, to get all persons that are in the current voyage
        let requestPersons : NSFetchRequest<Person> = Person.fetchRequest()
        requestPersons.sortDescriptors = [NSSortDescriptor(key:#keyPath(Person.pfirstname),ascending:true)]

        //let fetchPersonsResult = NSFetchedResults(fetchRequest: requestPersons, managedObjectContext:
           // CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)

            /* work in progress
        do{
            var people = try fetchPersonsResultController.performFetch()
            print(people)
        } catch {}*/
        
        

        // prepare a request for the depenses that belong to these persons
        let request : NSFetchRequest<Depense> = Depense.fetchRequest()
        request.predicate = NSPredicate(format: "paidBy.pfirstname == %@", SingletonStore.shared.currentVoyage!.name)
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
        }
    }
}

