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
    
    func add(contact: Contact) {}
    func remove(at offsets: IndexSet) {}
    func deleteImage(imagePath: String?) {
        ImageUtils().deleteImage(imagePath: imagePath)
    }
}
