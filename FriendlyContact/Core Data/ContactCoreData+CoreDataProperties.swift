//
//  ContactCoreData+CoreDataProperties.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 24/07/23.
//
//

import Foundation
import CoreData


extension ContactCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactCoreData> {
        return NSFetchRequest<ContactCoreData>(entityName: "ContactCoreData")
    }

    @NSManaged public var contactName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var imagePath: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var locationRecord: Bool

    var name: String {
        contactName ?? "Unknown name"
    }
}

extension ContactCoreData : Identifiable {

}
