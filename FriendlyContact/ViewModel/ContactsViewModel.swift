//
//  ContactsViewModel.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import Foundation

class ContactsViewModel: ObservableObject {
    @Published private(set) var contacts = [Contact(name: "Test")]
    
    @Published var showingAddContact = false
    @Published var showingPicker = false
    
    func addContact(contact: Contact) {
        contacts.append(contact)
    }
}
