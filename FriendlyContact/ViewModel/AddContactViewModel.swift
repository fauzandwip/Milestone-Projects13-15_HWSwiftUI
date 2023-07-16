//
//  AddContactViewModel.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

class AddContactViewModel: ObservableObject {
    @Published var inputImage: UIImage?
//    @Published var contact: Contact 
    
    @Published var textName = ""
    @Published var showingPicker = false
}
