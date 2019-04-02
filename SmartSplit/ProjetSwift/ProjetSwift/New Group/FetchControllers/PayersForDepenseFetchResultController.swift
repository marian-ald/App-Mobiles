//
//  PayersForPayerFetchResultController.swift
//  ProjetSwift
//
//  Created by user152227 on 4/2/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit
import CoreData


class PayersForDepenseFetchResultController: NSObject, NSFetchedResultsControllerDelegate {
    
    let tableView  : UITableView
    var depenseName : String
    
    init(view : UITableView, depenseName : String){
        self.tableView  = view
        self.depenseName = depenseName
        super.init()
        /*do{
            try self.payersFetched
        }
        catch let error as NSError{
            fatalError(error.description)
        }*/
        
    }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: - FetchResultController
    func fetchPlayers() -> PayerSetViewModel {
        
        // i need the pfirstname and plastname of all participants of all current voyage
        
        let moc = CoreDataManager.context;
        let personsFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        personsFetch.predicate = NSPredicate(format: "participate.vname == %@", SingletonStore.shared.currentVoyage!.name)
        
        var namesOfParticipants : [(String)] = []
        do {
            let fetchedPersons = try moc.fetch(personsFetch) as! [Person]
            for personResulted in fetchedPersons {
                namesOfParticipants.append(personResulted.fullname)
            }
        }
        catch{
            print("oopsie error!!")
        }
        
        // i need all the people who paid for this depense
        let peoplePaidFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "AssociationDepensePayer")
        peoplePaidFetch.predicate = NSPredicate(format: "nameDepense == %@", self.depenseName)
        
        var namesOfPayers : [(String, Float)] = []
        var onlyNamesOfPayers : [String] = []
        do {
            let fetchedAssoc = try moc.fetch(peoplePaidFetch) as! [AssociationDepensePayer]
            for assocResulted in fetchedAssoc{
                namesOfPayers.append((assocResulted.firstnameP + " " + assocResulted.lastnameP, assocResulted.sum))
                onlyNamesOfPayers.append(assocResulted.firstnameP + " " + assocResulted.lastnameP)
            }
        }
        catch{
            print("oopsie error!!")
        }
        
        // i need all the people who did not benefit from this depense
        let peopleNoBenefitFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        peopleNoBenefitFetch.predicate = NSPredicate(format: "any noBenefit.nameDepense = %@", self.depenseName)
        
        var namesOfNB : [String] = []
        do {
            let fetchedPersons = try moc.fetch(peopleNoBenefitFetch) as! [Person]
            for personResulted in fetchedPersons {
                namesOfNB.append(personResulted.fullname)
            }
        }
        catch{
            print("oopsie error!!")
        }
        
        var payers: PayerSetViewModel = PayerSetViewModel()
        for nameParticipant in namesOfParticipants {
            
            let isBeneficiary : Bool = !namesOfNB.contains(nameParticipant)
            
            if !onlyNamesOfPayers.contains(nameParticipant) {
                payers.add(payer: Payer(isBeneficiary: isBeneficiary, fullNamePayer: nameParticipant, sumPaid: 0))
            } else {
                for parts in namesOfPayers {
                    if parts.0 == nameParticipant {
                        payers.add(payer: Payer(isBeneficiary: isBeneficiary, fullNamePayer: nameParticipant, sumPaid: parts.1))
                    }
                    
                }
                
            }
        }
        print(payers)
        return payers
        
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


