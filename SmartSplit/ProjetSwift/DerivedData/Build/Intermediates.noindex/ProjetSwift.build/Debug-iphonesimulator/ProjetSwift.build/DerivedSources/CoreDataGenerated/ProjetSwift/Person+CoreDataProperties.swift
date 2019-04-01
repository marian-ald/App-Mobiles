//
//  Person+CoreDataProperties.swift
//  
//
//  Created by Marian ALDESCU on 26/03/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var pfirstname: String?
    @NSManaged public var pimage: String?
    @NSManaged public var plastname: String?
    @NSManaged public var pstartDate: Date?
    @NSManaged public var pstopDate: Date?
    @NSManaged public var noBenefit: NSSet?
    @NSManaged public var paid: NSSet?
    @NSManaged public var participate: Voyage?
    @NSManaged public var receiver: NSSet?
    @NSManaged public var sender: NSSet?

}

// MARK: Generated accessors for noBenefit
extension Person {

    @objc(addNoBenefitObject:)
    @NSManaged public func addToNoBenefit(_ value: Depense)

    @objc(removeNoBenefitObject:)
    @NSManaged public func removeFromNoBenefit(_ value: Depense)

    @objc(addNoBenefit:)
    @NSManaged public func addToNoBenefit(_ values: NSSet)

    @objc(removeNoBenefit:)
    @NSManaged public func removeFromNoBenefit(_ values: NSSet)

}

// MARK: Generated accessors for paid
extension Person {

    @objc(addPaidObject:)
    @NSManaged public func addToPaid(_ value: Depense)

    @objc(removePaidObject:)
    @NSManaged public func removeFromPaid(_ value: Depense)

    @objc(addPaid:)
    @NSManaged public func addToPaid(_ values: NSSet)

    @objc(removePaid:)
    @NSManaged public func removeFromPaid(_ values: NSSet)

}

// MARK: Generated accessors for receiver
extension Person {

    @objc(addReceiverObject:)
    @NSManaged public func addToReceiver(_ value: Transfer)

    @objc(removeReceiverObject:)
    @NSManaged public func removeFromReceiver(_ value: Transfer)

    @objc(addReceiver:)
    @NSManaged public func addToReceiver(_ values: NSSet)

    @objc(removeReceiver:)
    @NSManaged public func removeFromReceiver(_ values: NSSet)

}

// MARK: Generated accessors for sender
extension Person {

    @objc(addSenderObject:)
    @NSManaged public func addToSender(_ value: Transfer)

    @objc(removeSenderObject:)
    @NSManaged public func removeFromSender(_ value: Transfer)

    @objc(addSender:)
    @NSManaged public func addToSender(_ values: NSSet)

    @objc(removeSender:)
    @NSManaged public func removeFromSender(_ values: NSSet)

}
