//
//  ContactCoreData+CoreDataClass.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 21/07/23.
//
//

import Foundation
import CoreData

@objc(ContactCoreData)
public class ContactCoreData: NSManagedObject, Comparable {

    public static func <(lhs: ContactCoreData, rhs: ContactCoreData) -> Bool {
        lhs.name < rhs.name
    }
}
