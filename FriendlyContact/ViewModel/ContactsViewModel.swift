//
//  ContactsViewModel.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import Foundation

class ContactsViewModel: ObservableObject {
    @Published var contacts = [Contact(name: "Test")]
    
    func addContact(contact: Contact) {
        contacts.append(contact)
    }
}
