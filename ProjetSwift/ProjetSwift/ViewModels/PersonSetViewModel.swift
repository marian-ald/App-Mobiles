//
//  PersonSetViewModel.swift
//  ProjetSwift
//
//  Created by admin on 25/03/2019.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation
import UIKit
import CoreData


//----------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------
// MARK: -
/// Delegate to simulate reactive programming to change of person set
protocol PersonSetViewModelDelegate {
    
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    /// called when a Person is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func personDeleted(at indexPath: IndexPath)
    /// called when a Person is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func personUpdated(at indexPath: IndexPath)
    /// called when a Person is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func personAdded(at indexPath: IndexPath)
}


//----------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------
// MARK: -

class PersonSetViewModel{
    
    // MARK: -
    var delegate : PersonSetViewModelDelegate? = nil
    
    var personsFetched : NSFetchedResultsController<Person>
    
    init(data: NSFetchedResultsController<Person>){
        self.personsFetched = data
    }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: View Model functions
    /// add a new person in set of persons
    ///
    /// - Parameter person: Person to be added
    
    public func add(person: Person){
        if let indexPath = self.personsFetched.indexPath(forObject: person){
            self.delegate?.personAdded(at: indexPath)
            
        } }
    public var count : Int {
        return self.personsFetched.fetchedObjects?.count ?? 0
    }
    public func get(personAt index: Int) -> Person?{
        return self.personsFetched.object(at: IndexPath(row: index, section: 0))
    }
}
