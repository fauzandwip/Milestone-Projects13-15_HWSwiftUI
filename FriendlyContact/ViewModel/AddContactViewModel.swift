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
    @Published var showingAlert = false
    @Published var alertMessage = ""
    
    init(contactsVM: ContactsViewModel) {
        _contactsVM = ObservedObject(initialValue: contactsVM)
    }
    
    func addContact() {
        guard inputImage != nil else { return }
        guard textName != "" else { return }
        
        var newContact = Contact(name: textName, imagePath: nil)
        newContact.imagePath = setImage(uiImage: inputImage)
        contactsVM.add(contact: newContact)
    }
    
    func setImage(uiImage: UIImage?) -> String? {
        if let uiImage = uiImage {
            if let data = uiImage.jpegData(compressionQuality: 0.8) {
                return ImageUtils().setImage(imageData: data)
            }
        }
        
        return nil
    }
    
    func isFilled() {
        showingAlert = true
        
        if inputImage == nil {
            alertMessage = "Image can't be empty"
        } else if textName == "" {
            alertMessage = "Name can't be empty"
        } else {
            alertMessage = "Are u sure, to save the contact?"
        }
    }
}
