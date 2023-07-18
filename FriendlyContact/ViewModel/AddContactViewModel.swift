//
//  AddContactViewModel.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

class AddContactViewModel: ObservableObject {
    
    @ObservedObject var contactsVM: ContactsViewModel
    
    @Published var inputImage: UIImage?
    @Published var textName = ""
    @Published var showingPicker = false
    
    var newContact: Contact?
    
    init(contactsVM: ContactsViewModel) {
        _contactsVM = ObservedObject(initialValue: contactsVM)
    }
    
    func addContact() {
        guard inputImage != nil else { return }
        guard textName != "" else { return }
        
        newContact = Contact(name: textName, imagePath: nil)
//        print(newContact!)
        setImage(uiImage: inputImage)
//        print(newContact!)
        contactsVM.addContact(contact: newContact!)
//        print(contactsVM.contacts)
    }
    
    func setImage(uiImage: UIImage?) {
        if let uiImage = uiImage {
            if let data = uiImage.jpegData(compressionQuality: 0.8) {
                newContact?.imagePath = ImageUtils().setImage(imageData: data)
            }
        }
    }
}
