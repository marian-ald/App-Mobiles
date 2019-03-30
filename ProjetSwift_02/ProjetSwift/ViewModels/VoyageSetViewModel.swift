//
//  VoyageSetViewModel.swift
//  ProjetSwift
//
//  Created by Marian ALDESCU on 26/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation
import UIKit
import CoreData


//----------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------
// MARK: -
/// Delegate to simulate reactive programming to change of voyage set
protocol VoyageSetViewModelDelegate {
    
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    /// called when a voyage is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func voyageDeleted(at indexPath: IndexPath)
    /// called when a voyage  is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func voyageUpdated(at indexPath: IndexPath)
    /// called when a voyage is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func voyageAdded(at indexPath: IndexPath)
}


//----------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------
// MARK: -

class VoyageSetViewModel{
    
    // MARK: -
    var delegate : VoyageSetViewModelDelegate? = nil
    
    var voyagesFetched : NSFetchedResultsController<Voyage>
    
    init(data: NSFetchedResultsController<Voyage>){
        self.voyagesFetched = data
    }
    
    func get(VoyageWithName name: String) -> [Voyage]?{
        return VoyageDAO.fetchByName(name: name)
    }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: View Model functions
    /// add a new voyage in set of Voyages
    ///
    /// - Parameter voyage: Voyage to be added
    
    public func add(voyage: Voyage){
        if let indexPath = self.voyagesFetched.indexPath(forObject: voyage){
            self.delegate?.voyageAdded(at: indexPath)
            SingletonStore.shared.currentVoyage = voyage
        } }
    public var count : Int {
        return self.voyagesFetched.fetchedObjects?.count ?? 0
    }
    public func get(voyageAt index: Int) -> Voyage?{
        return self.voyagesFetched.object(at: IndexPath(row: index, section: 0))
    }
    
    
}

