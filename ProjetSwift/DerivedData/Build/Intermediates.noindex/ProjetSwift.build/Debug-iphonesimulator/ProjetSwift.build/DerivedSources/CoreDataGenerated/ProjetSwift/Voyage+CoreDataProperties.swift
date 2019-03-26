//
//  Voyage+CoreDataProperties.swift
//  
//
//  Created by Marian ALDESCU on 26/03/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Voyage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Voyage> {
        return NSFetchRequest<Voyage>(entityName: "Voyage")
    }

    @NSManaged public var image: String?
    @NSManaged public var nameVoyage: String?
    @NSManaged public var place: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var stopDate: Date?
    @NSManaged public var contain: NSSet?

}

// MARK: Generated accessors for contain
extension Voyage {

    @objc(addContainObject:)
    @NSManaged public func addToContain(_ value: Person)

    @objc(removeContainObject:)
    @NSManaged public func removeFromContain(_ value: Person)

    @objc(addContain:)
    @NSManaged public func addToContain(_ values: NSSet)

    @objc(removeContain:)
    @NSManaged public func removeFromContain(_ values: NSSet)

}
