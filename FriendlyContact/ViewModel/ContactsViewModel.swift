//
//  ContactsViewModel.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

class ContactsViewModel: ObservableObject {
    @Published var contacts = [Contact]()
    
    @Published var showingAddContact = false
    @Published var showingPicker = false
    
    func add(contact: Contact) {
    }
}
//
//class ContactsViewModel: ObservableObject {
//    @Published private(set) var contacts = [Contact]()
//
//    @Published var showingAddContact = false
//    @Published var showingPicker = false
//
//    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedContacts")
//
//    init() {
//        do {
//            let data = try Data(contentsOf: savePath)
//            let decoded = try JSONDecoder().decode([Contact].self, from: data)
//            contacts = decoded
//        } catch {
//            contacts = []
//        }
//    }
//
//    func addContact(contact: Contact) {
//        contacts.append(contact)
//        saveData()
//    }
//
//    func saveData() {
//        do {
//            let data = try JSONEncoder().encode(contacts)
//            try data.write(to: savePath)
//        } catch {
//            fatalError("Failed to write data to disk: \(error.localizedDescription)")
//        }
//
//    }
//}
