//
//  Transfers+CoreDataProperties.swift
//  
//
//  Created by Marian ALDESCU on 26/03/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Transfers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transfers> {
        return NSFetchRequest<Transfers>(entityName: "Transfers")
    }

    @NSManaged public var amountTransfer: Float
    @NSManaged public var isDone: Bool
    @NSManaged public var receivedBy: Person?
    @NSManaged public var sentBy: Person?

}
