//
//  TransferSetViewModel.swift
//  ProjetSwift
//
//  Created by user151921 on 4/1/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation
import UIKit
import CoreData


//----------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------
// MARK: -
/// Delegate to simulate reactive programming to change of transfer set
protocol TransferSetViewModelDelegate {
    
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    /// called when a transfer is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    /// func transferDeleted(at indexPath: IndexPath)
    /// called when a transfer  is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func transferUpdated(at indexPath: IndexPath)
    /// called when a transfer is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func transferAdded(at indexPath: IndexPath)
}


//----------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------
// MARK: -

class TransferSetViewModel{
    
    // MARK: -
    var delegate : TransferSetViewModelDelegate? = nil
    
    var transfersFetched : NSFetchedResultsController<Transfer>
    
    init(data: NSFetchedResultsController<Transfer>){
        self.transfersFetched = data
    }
    
//    func get(TransferWithName name: String) -> [Transfer]?{
//        return TransferDAO.fetchByName(name: name)
//    }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: View Model functions
    /// add a new transfer in set of Transfers
    ///
    /// - Parameter transfer: Transfer to be added
    
    public func add(transfer: Transfer){
        if let indexPath = self.transfersFetched.indexPath(forObject: transfer){
            self.delegate?.transferAdded(at: indexPath)
        //    SingletonStore.shared.currentVoyage = voyage
        }
    }
    
    public var count : Int {
        return self.transfersFetched.fetchedObjects?.count ?? 0
    }
    
    public func get(transferAt index: Int) -> Transfer?{
        return self.transfersFetched.object(at: IndexPath(row: index, section: 0))
    }
    
    
}

