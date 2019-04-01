//
//  Transfer+CoreDataProperties.swift
//  
//
//  Created by Marian ALDESCU on 26/03/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Transfer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transfer> {
        return NSFetchRequest<Transfer>(entityName: "Transfer")
    }

    @NSManaged public var amountTransfer: Float
    @NSManaged public var dateTransfer: Date?
    @NSManaged public var isDone: Bool
    @NSManaged public var receivedBy: Person?
    @NSManaged public var sentBy: Person?

}
