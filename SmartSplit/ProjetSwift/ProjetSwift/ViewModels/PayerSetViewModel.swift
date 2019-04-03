//
//  PayerSetViewModel.swift
//  ProjetSwift
//
//  Created by user152227 on 4/2/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

protocol PayerSetViewModelDelegate {
    
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    /// called when a Depense is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    //func depenseDeleted(at indexPath: IndexPath)
    
    /// called when a Depense is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func payerUpdated(at indexPath: IndexPath)
    
    /// called when a Depense is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func payerAdded(at indexPath: IndexPath)
}

class PayerSetViewModel {
    
    var delegate : PayerSetViewModelDelegate? = nil

    var payersFetched : [Payer]
    
    init(){
        payersFetched = []
    }

    init( data: [Payer] ){
        self.payersFetched = data
    }

    //-------------------------------------------------------------------------------------------------
    // MARK: View Model functions
    /// add a new payer in set of depenses
    ///
    /// - Parameter depense: Depense to be added

    public func add(payer: Payer){
            self.payersFetched.append(payer)
    }
    
    
    public var count : Int {
        return self.payersFetched.count
    }
    
    public func get(payerAt index: Int) -> Payer?{
        return self.payersFetched[index]
    }
}

