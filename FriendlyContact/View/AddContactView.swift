//
//  AddContactView.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var vm: AddContactViewModel
    var onSave: (Contact) -> Void
    
    
    
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
                    addContact()
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
    
    func addContact() {
        guard vm.inputImage != nil else { return }
        guard vm.textName != "" else { return }
        
        let newContact = Contact(name: vm.textName)
        onSave(newContact)
        
        dismiss()
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView() { _ in }
    }
}
