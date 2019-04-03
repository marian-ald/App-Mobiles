//
//  BalanceItemSetViewModel.swift
//  ProjetSwift
//
//  Created by user152227 on 4/3/19.
//  Copyright © 2019 Marian ALDESCU. All rights reserved.
//

import Foundation

protocol BalanceItemSetViewModelDelegate {
    
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    /// called when a BalanceItem is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func balanceItemDeleted(at indexPath: IndexPath)
    
    /// called when a BalanceItem is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func balanceItemUpdated(at indexPath: IndexPath)
    
    /// called when a BalanceItem is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func balanceItemAdded(at indexPath: IndexPath)
}

class BalanceItemSetViewModel {
    
    var delegate : BalanceItemSetViewModelDelegate? = nil
    
    var balanceItemsFetched : [(String, Float)]
    
    init(){
        balanceItemsFetched = []
    }
    
    init( data: [(String, Float)] ){
        self.balanceItemsFetched = data
    }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: View Model functions
    /// add a new balanceItem in set of balanceItems
    ///
    /// - Parameter balanceItem: BalanceItem to be added
    
    public func add(fullname : String, sum : Float){
        self.balanceItemsFetched.append((fullname, sum))
    }
    
    
    public var count : Int {
        return self.balanceItemsFetched.count
    }
    
    public func get(sumBalanceItemAt fullname: String) -> Float?{
        for el in balanceItemsFetched {
            if el.0 == fullname {
                return el.1
            }
        }
        return 0
    }
    
    public func getByIndex(elementAt i: Int) -> (String, Float)? {
        return self.balanceItemsFetched[i]
    }
    
    public func put(fullname: String, value: Float){
        for i in 0...balanceItemsFetched.count - 1 {
            if balanceItemsFetched[i].0 == fullname {
                let newValue = value + balanceItemsFetched[i].1
                balanceItemsFetched.remove(at: i)
                balanceItemsFetched.append((fullname, newValue))
            }
        }
    }
    
    public func addToPerson(fullname: String, value: Float){
        for i in 0...balanceItemsFetched.count - 1 {
            if balanceItemsFetched[i].0 == fullname {
                let newValue = value + balanceItemsFetched[i].1
                balanceItemsFetched.remove(at: i)
                balanceItemsFetched.append((fullname, newValue))
                break
            }
        }
    }
}
