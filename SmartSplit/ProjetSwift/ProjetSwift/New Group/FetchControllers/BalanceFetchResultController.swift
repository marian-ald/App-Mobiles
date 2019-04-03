//
//  BalanceFetchResultController.swift
//  ProjetSwift
//
//  Created by user152227 on 4/3/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import UIKit
import CoreData

class BalanceFetchResultController: NSObject, NSFetchedResultsControllerDelegate {

    let tableView  : UITableView
    
    init(view : UITableView){//}, model : PersonSetViewModel){
        self.tableView  = view
        
        
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - FetchResultController
    func balancesFetched() -> BalanceItemSetViewModel  {
        
        let balancesResult = BalanceItemSetViewModel()
        // i need the pfirstname and plastname of all participants of all current voyage
        
        let myContr = PersonsForVoyageFetchResultController(view: tableView)
        let personsFetchedOpt = myContr.personsFetched.fetchedObjects
        
        print("ps fetched")
        print(personsFetchedOpt!)
        if let personsFetched = personsFetchedOpt {
            
            for personResulted in personsFetched {
                // Initializez cu 0
                balancesResult.add(fullname: personResulted.fullname, sum: 0)
            }
            // De aici noua rezolvare
            
            var allDepensesOpt = DepenseDAO.fetchAll()
            
            if let allDepenses = allDepensesOpt {
                for depense in allDepenses {
                    let nameDepense = depense.nameD
                    let allAssocsForDepense = AssocDepensePersonDAO.fetchByDepenseName(nameDepense: nameDepense)
                    var totalSum : Float = 0
                    
                    var fullnamesOfPayers : [String] = []
                    
                    for assoc in allAssocsForDepense! {
                        totalSum = totalSum + assoc.sum
                        // adaug peste tot assoc.sum (unde exista)
                        balancesResult.addToPerson(fullname: assoc.fullnameP, value: assoc.sum)
                        // to get the names of payers
                        fullnamesOfPayers.append(assoc.fullnameP)
                    }
                    
                    var nonBeneficiersPourDepense = PersonDAO.fetchNonBeneficiariesForADepense(forDepenseName: nameDepense)
                    
                    var fullNameNonBeneficiaries : [String] = []
                    
                    for nonBenef in nonBeneficiersPourDepense! {
                        fullNameNonBeneficiaries.append(nonBenef.fullname)
                    }
                    
                    let partieChacun : Float
                    
                    // now i need the names of beneficiaries
                    if nonBeneficiersPourDepense?.count == personsFetched.count {
                        partieChacun = totalSum / Float(personsFetched.count)
                    }
                    else {
                        partieChacun = totalSum / Float(personsFetched.count - nonBeneficiersPourDepense!.count)
                    }
                    
                    // 4 cases : (yes/no) paid and (yes/no) benefitted
                    
                    for person in personsFetched {
                        if fullnamesOfPayers.contains(person.fullname) && !fullNameNonBeneficiaries.contains(person.fullname){
                            // has paid and benefits from it
                            balancesResult.addToPerson(fullname: person.fullname, value: -partieChacun)
                        }
                        else if fullnamesOfPayers.contains(person.fullname) && fullNameNonBeneficiaries.contains(person.fullname){
                            // has paid and NOT benefits from it
                            // balancesResult.addToPerson(fullname: person.fullname, sum: 0)
                        }
                        
                        else if !fullnamesOfPayers.contains(person.fullname) && !fullNameNonBeneficiaries.contains(person.fullname){
                            // has paid and benefits from it
                            balancesResult.addToPerson(fullname: person.fullname, value: -partieChacun)
                        }
                        else if !fullnamesOfPayers.contains(person.fullname) && fullNameNonBeneficiaries.contains(person.fullname){
                            // has paid and benefits from it
                            // balancesResult.addToPerson(fullname: person.fullname, sum: 0)
                        }
                    }
                    
                }
                
            }
            
            
            // Pana aici noua rezolvare
            /*
            for personResulted in personsFetched {
            
                // Iau toate depenseurile facute de el
                let allAssociationsForThisPayer = AssocDepensePersonDAO.fetchByPayerName(fullnamePayer: personResulted.fullname)
                
                // pentru fiecare asociere
                
                if let assocs = allAssociationsForThisPayer {
                    
                    for assoc in assocs {
                        print("Suma e")
                        print(assoc.sum)
                        // adaug suma la cheltuielile lui
                        balancesResult.addToPerson(fullname: assoc.fullnameP, value: assoc.sum)
                        
                        // apoi adaug suma impartita la nrul de beneficiari la cbeneficiari ca si datoerie
                        // i need a get beneficiaries by depense
                        
                        
                        let nonBeneficiaries = PersonDAO.fetchNonBeneficiariesForADepense(forDepenseName: assoc.nameD)
                        
                        var nonBeneficiariesFullNames : [String] = []
                        for benef in nonBeneficiaries! {
                            nonBeneficiariesFullNames.append(benef.fullname)
                        }
                        
                        for otherPerson in personsFetched {
                            
                            // if it is a beneficiary, different than the payer
                            if otherPerson.fullname != personResulted.fullname &&
                                !nonBeneficiariesFullNames.contains(otherPerson.fullname) {
                                
                                if (personsFetched.count - nonBeneficiaries!.count) > 0 {
                                    balancesResult.addToPerson(fullname: otherPerson.fullname, value: (-assoc.sum) / Float((personsFetched.count - nonBeneficiaries!.count)))

                                }
                                
                                else {
                                    balancesResult.addToPerson(fullname: otherPerson.fullname, value: (-assoc.sum) / 1)
                                    // this is not ok ! but only to not have -inf
                                }
                            }
                        }
                    }
                }
            }*/
        }
        
        print("My Balances")
        print(balancesResult.balanceItemsFetched)
        return balancesResult
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
