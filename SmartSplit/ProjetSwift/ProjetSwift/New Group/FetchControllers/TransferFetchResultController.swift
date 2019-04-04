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
        /*do{
            try self.transfersFetched.performFetch()
        }
        catch let error as NSError{
            fatalError(error.description)
        }*/
        
    }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: - FetchResultController
    func transfersFetched() -> TransferSetViewModel {
        var transfersSuggested : TransferSetViewModel = TransferSetViewModel()
        
        // Now let's compute transfers necessary
        print("Git here in TF1")
        var balancesController = BalanceFetchResultController(view: tableView)
        var balances = balancesController.balancesFetched()
        
        var positiveBalances = BalanceItemSetViewModel()
        var negativeBalances = BalanceItemSetViewModel()
        print("Git here in TF2")
        for i in 0..<balances.count {
            var bl = balances.getByIndex(elementAt: i)
            if let bll = bl {
                if bll.1 >= Float(0) {
                    positiveBalances.add(fullname: bll.0, sum: bll.1)
                }
                else {
                    negativeBalances.add(fullname: bll.0, sum: bll.1)
                }
            }
        }
        
        while(positiveBalances.count > 0 && negativeBalances.count > 0) {
            let balanceP = positiveBalances.getByIndex(elementAt: 0)
            let balanceN = negativeBalances.getByIndex(elementAt: 0)
            
            if (balanceP?.1)! > (-(balanceN?.1)!) {
                positiveBalances.addToPerson(fullname: balanceP!.0, value: (balanceN?.1)! )
                negativeBalances.deleteByIndex(elementAt: 0)
                transfersSuggested.add(fullnameSender: (balanceN?.0)!, fullnameReceiver: (balanceP?.0)!, sum: -(balanceN?.1)!)
            }
            else {
                if (balanceP?.1)! < (-(balanceN?.1)!) {
                negativeBalances.addToPerson(fullname: balanceN!.0, value: (balanceP?.1)! )
                negativeBalances.deleteByIndex(elementAt: 0)
                transfersSuggested.add(fullnameSender: (balanceP?.0)!, fullnameReceiver: (balanceN?.0)!, sum: -(balanceP?.1)!)
                }
                
                else {
                    transfersSuggested.add(fullnameSender: (balanceN?.0)!, fullnameReceiver: (balanceP?.0)!, sum: -(balanceN?.1)!)
                    negativeBalances.deleteByIndex(elementAt: 0)
                    positiveBalances.deleteByIndex(elementAt: 0)
                    
                }
                
            }
        }
        print("Trraaaansfers suggested")
        print(transfersSuggested)
        return transfersSuggested
    }
    
    
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

