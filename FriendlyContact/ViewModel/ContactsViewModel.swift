//
//  ContactsViewModel.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

class ContactsViewModel: ObservableObject {
    @Published private(set) var contacts = [Contact]()
    
    @Published var showingAddContact = false
    @Published var showingPicker = false
    
    func addContact(contact: Contact) {
        contacts.append(contact)
    }
}
