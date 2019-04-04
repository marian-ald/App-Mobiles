//
//  TransferSetViewModel.swift
//  ProjetSwift
//
//  Created by user152227 on 4/3/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

protocol TransferSetViewModelDelegate {
    
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    /// called when a Transfer is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func transferDeleted(at indexPath: IndexPath)
    
    /// called when a Transfer is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func transferUpdated(at indexPath: IndexPath)
    
    /// called when a Transfer is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func transferAdded(at indexPath: IndexPath)
}

class TransferSetViewModel {
    
    var delegate : TransferSetViewModelDelegate? = nil
    
    var transfersFetched : [Transfer]
    
    init(){
        transfersFetched = []
    }
    
    init( data: [Transfer] ){
        self.transfersFetched = data
    }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: View Model functions
    /// add a new transfer in set of transfers
    ///
    /// - Parameter transfer: Transfer to be added
    
    public func add(fullnameSender : String, fullnameReceiver : String, sum : Float){
        self.transfersFetched.append(Transfer(fullnameSender: fullnameSender, fullnameReceiver: fullnameReceiver, sum: sum))
    }
    
    
    public var count : Int {
        return self.transfersFetched.count
    }
    
    
    public func get(elementAt i: Int) -> Transfer {
        return self.transfersFetched[i]
    }
    
}

