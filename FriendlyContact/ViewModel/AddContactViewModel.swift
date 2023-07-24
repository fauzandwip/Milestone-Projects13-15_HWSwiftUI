//
//  AddContactViewModel.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import CoreLocation
import SwiftUI

class AddContactViewModel: ObservableObject {
    
    @ObservedObject var contactsVM: ContactsViewModel
    let locationFetcher = LocationFetcher()
    
    @Published var inputImage: UIImage?
    @Published var textName = ""
    @Published var locationRecord = false
    @Published var location: CLLocationCoordinate2D?
    
    @Published var showingPicker = false
    @Published var showingAlert = false
    @Published var alertMessage = ""
    @Published var locationSwitchOn = false
    @Published var showingAlertLocation = false
    
    init(contactsVM: ContactsViewModel) {
        _contactsVM = ObservedObject(initialValue: contactsVM)
    }
    
    func addContact() {
        guard inputImage != nil else { return }
        guard textName != "" else { return }
        
        var newContact = Contact(name: textName, imagePath: nil)
        newContact.imagePath = setImage(uiImage: inputImage)
        newContact.locationRecord = locationRecord
        newContact.latitude = location?.latitude ?? 0
        newContact.longitude = location?.longitude ?? 0
        
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
