//
//  AddContactView.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    
//    @EnvironmentObject static var contactsVM: ContactsViewModel
//    @StateObject var vm = AddContactViewModel()
    @StateObject private var vm: AddContactViewModel
//    @StateObject private var imageVM = ImageViewModel(contact: <#T##Contact#>)
    
    init(contactsVM: ContactsViewModel) {
        _vm = StateObject(wrappedValue: AddContactViewModel(contactsVM: contactsVM))
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Photo") {
                    ZStack {
                        Rectangle()
                            .fill(.gray)
                        
                        Text("Tap to choose image")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Image(uiImage: vm.inputImage ?? UIImage())
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 500, maxHeight: 400)
                    }
                    .onTapGesture {
                        vm.showingPicker = true
                    }
                    .scaledToFill()
                }
                
                Section("Name") {
                    TextField("name", text: $vm.textName)
                }
            }
            .navigationTitle("Add Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    // addContact()
                    vm.addContact()
                    dismiss()
                } label: {
                    Text("Add")
                        .font(.headline)
                }
            }
            .sheet(isPresented: $vm.showingPicker) {
                ImagePicker(image: $vm.inputImage)
            }
        }
    }
    
//    func addContact() {
//        guard vm.inputImage != nil else { return }
//        guard vm.textName != "" else { return }
//
//        let newContact = Contact(name: vm.textName)
//        contactsVM.addContact(contact: newContact)
//
//        dismiss()
//    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(contactsVM: ContactsViewModel())
    }
}
