//
//  Depenses+CoreDataProperties.swift
//  
//
//  Created by Marian ALDESCU on 26/03/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Depenses {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Depenses> {
        return NSFetchRequest<Depenses>(entityName: "Depenses")
    }

    @NSManaged public var date: Date?
    @NSManaged public var nameDepense: String?
    @NSManaged public var noBenefitBy: NSSet?
    @NSManaged public var paidBy: NSSet?

}

// MARK: Generated accessors for noBenefitBy
extension Depenses {

    @objc(addNoBenefitByObject:)
    @NSManaged public func addToNoBenefitBy(_ value: Person)

    @objc(removeNoBenefitByObject:)
    @NSManaged public func removeFromNoBenefitBy(_ value: Person)

    @objc(addNoBenefitBy:)
    @NSManaged public func addToNoBenefitBy(_ values: NSSet)

    @objc(removeNoBenefitBy:)
    @NSManaged public func removeFromNoBenefitBy(_ values: NSSet)

}

// MARK: Generated accessors for paidBy
extension Depenses {

    @objc(addPaidByObject:)
    @NSManaged public func addToPaidBy(_ value: Person)

    @objc(removePaidByObject:)
    @NSManaged public func removeFromPaidBy(_ value: Person)

    @objc(addPaidBy:)
    @NSManaged public func addToPaidBy(_ values: NSSet)

    @objc(removePaidBy:)
    @NSManaged public func removeFromPaidBy(_ values: NSSet)

}
