//
//  VoyageFetchResultController.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 26/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit
import CoreData



class VoyageFetchResultController: NSObject, NSFetchedResultsControllerDelegate {
    
    let tableView  : UITableView
    init(view : UITableView){
        self.tableView  = view
        // self.voyagesSet = model
        super.init()
        do{
            try self.voyagesFetched.performFetch()
        }
        catch let error as NSError{
            fatalError(error.description)
        }
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - FetchResultController
    lazy var voyagesFetched : NSFetchedResultsController<Voyage> = {
        // prepare a request
        let request : NSFetchRequest<Voyage> = Voyage.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Voyage.vname), ascending:true)]
        
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

