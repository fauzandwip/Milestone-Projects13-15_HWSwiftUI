//
//  ContactsCoreData.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 20/07/23.
//

import CoreData
import SwiftUI

class ContactsCoreData: ContactsViewModel {
    /// wrong - new way
//    @FetchRequest(sortDescriptors: [
//        SortDescriptor(\ContactCoreData.contactName, order: .forward)
//    ])
//    var items: FetchedResults<ContactCoreData> {
//        didSet {
//            saveContext()
//        }
//    }
    
    /// old way
    private var items = [ContactCoreData]() {
        didSet {
            saveContext()
        }
    }
    
    static let containerName = "FriendlyContacts"
    private let container = NSPersistentContainer(name: containerName)
    
    override init() {
        super.init()
        container.loadPersistentStores { description, error in
            if let error {
                print("Failed to load data from Core Data: \(error)")
            }
        }
        
        loadData()
    }
    
    private func loadData() {
        /// old way - correct
        let request = ContactCoreData.fetchRequest()
        let sort = NSSortDescriptor(key: "contactName", ascending: true)
        request.sortDescriptors = [sort]
        
        do {
            items = try container.viewContext.fetch(request)
            
            for item in items {
                let id = item.id ?? UUID()
                
                // corupted data
                if item.id == nil {
                    item.id = id
                }
                
                let contact = Contact(
                    id: id,
                    name: item.name,
                    imagePath: item.imagePath,
                    locationRecord: item.locationRecord,
                    latitude: item.latitude,
                    longitude: item.longitude)
                contacts.append(contact)
            }
            
            saveContext()
        } catch {
            fatalError("Failed to fetch data from Core Data: \(error.localizedDescription)")
        }
    }
    
    override func add(contact: Contact) {
        let newContact = ContactCoreData(context: container.viewContext)
        newContact.id = contact.id
        newContact.contactName = contact.name
        newContact.imagePath = contact.imagePath
        newContact.locationRecord = contact.locationRecord
        newContact.latitude = contact.latitude
        newContact.longitude = contact.longitude
        
        if let index = items.firstIndex(where: { $0.name > contact.name }) {
            items.insert(newContact, at: index)
            contacts.insert(contact, at: index)
        } else {
            items.append(newContact)
            contacts.append(contact)
        }
    }
    
    override func remove(at offsets: IndexSet) {
        if let index = offsets.first {
            let contact = items[index]
            deleteImage(imagePath: contact.imagePath)
            container.viewContext.delete(contact)
        }
        
        contacts.remove(atOffsets: offsets)
        items.remove(atOffsets: offsets)
    }
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                fatalError("Failed save data to Core Data: \(error)")
            }
        }
    }
}
