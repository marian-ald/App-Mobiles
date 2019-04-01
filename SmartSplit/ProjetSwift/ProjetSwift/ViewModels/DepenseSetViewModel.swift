//
//  DepenseSetViewModel.swift
//  ProjetSwift
//
//  Created by user152227 on 4/1/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation
import UIKit
import CoreData

/// Delegate to simulate reactive programming to change of depense set
protocol DepenseSetViewModelDelegate {
    
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    /// called when a Depense is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func depenseDeleted(at indexPath: IndexPath)
    /// called when a Depense is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func depenseUpdated(at indexPath: IndexPath)
    /// called when a Depense is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func depenseAdded(at indexPath: IndexPath)
}

class DepenseSetViewModel{
    
    // MARK: -
    var delegate : DepenseSetViewModelDelegate? = nil
    
    var depensesFetched : NSFetchedResultsController<Depense>
    
    init(data: NSFetchedResultsController<Depense>){
        self.depensesFetched = data
    }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: View Model functions
    /// add a new depense in set of depenses
    ///
    /// - Parameter depense: Depense to be added
    
    public func add(depense: Depense){
        if let indexPath = self.depensesFetched.indexPath(forObject: depense){
            self.delegate?.depenseAdded(at: indexPath)
            
        } }
    public var count : Int {
        return self.depensesFetched.fetchedObjects?.count ?? 0
    }
    public func get(depenseAt index: Int) -> Depense?{
        return self.depensesFetched.object(at: IndexPath(row: index, section: 0))
    }
}
