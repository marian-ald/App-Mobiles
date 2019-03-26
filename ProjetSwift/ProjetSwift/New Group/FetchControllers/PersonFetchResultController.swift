//
//  PersonFetchResultController.swift
//  ProjetSwift
//
//  Created by admin on 25/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit
import CoreData


class PersonFetchResultController: NSObject, NSFetchedResultsControllerDelegate{//}, PersonSetViewModelDelegate{
    
    let tableView  : UITableView
    //
    //
    
    //let personsSet : PersonSetViewModel
    
    init(view : UITableView){//}, model : PersonSetViewModel){
        self.tableView  = view
        // self.personsSet = model
        super.init()
        do{
            try self.personsFetched.performFetch()
        }
        catch let error as NSError{
            fatalError(error.description)
        } }
    //-------------------------------------------------------------------------------------------------
    // MARK: - FetchResultController
    lazy var personsFetched : NSFetchedResultsController<Person> = {
        // prepare a request
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        request.sortDescriptors =
            [NSSortDescriptor(key:#keyPath(Person.plastname),ascending:true),NSSortDescriptor(key:#keyPath(Person.pfirstname)
                ,ascending:true)]
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
