//
//  TransferFetchResultController.swift
//  ProjetSwift
//
//  Created by user151921 on 4/1/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//


import UIKit
import CoreData


class TransferFetchResultController: NSObject, NSFetchedResultsControllerDelegate {
    
    let tableView  : UITableView
    //
    //
    //let transfersSet : TransferSetViewModel
    
    init(view : UITableView){//}, model : TransferSetViewModel){
        self.tableView  = view
        // self.transfersSet = model
        super.init()
        do{
            try self.transfersFetched.performFetch()
        }
        catch let error as NSError{
            fatalError(error.description)
        } }
    //-------------------------------------------------------------------------------------------------
    // MARK: - FetchResultController
    lazy var transfersFetched : NSFetchedResultsController<Transfer> = {
        // prepare a request
        let request : NSFetchRequest<Transfer> = Transfer.fetchRequest()
///>>>>        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Transfer.vname), ascending:true)]
        
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Transfer.sentBy), ascending:true),
                                   NSSortDescriptor(key:#keyPath(Transfer.receivedBy), ascending:true)]
        
        
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

