//
//  FileContacts.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 21/07/23.
//

import Foundation

class FileContacts: ContactsViewModel {
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedContacts.json")
    
    override init() {
        super.init()
        loadData()
    }
    
    func loadData() {
        do {
            let data = try Data(contentsOf: savePath)
            let decoded = try JSONDecoder().decode([Contact].self, from: data)
            contacts = decoded
            contacts.sort()
        } catch {
            contacts = []
        }
    }
    
    override func add(contact: Contact) {
        contacts.append(contact)
        contacts.sort()
        saveData()
    }
    
    override func remove(at offsets: IndexSet) {
        if let index = offsets.first {
            let imagePath = contacts[index].imagePath
            deleteImage(imagePath: imagePath)
        }
        contacts.remove(atOffsets: offsets)
        saveData()
    }
    
    func saveData() {
        do {
            let data = try JSONEncoder().encode(contacts)
            try data.write(to: savePath)
        } catch {
            fatalError("Failed to write data to disk: \(error.localizedDescription)")
        }
    }
}
