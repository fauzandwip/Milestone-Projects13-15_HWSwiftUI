//
//  AddContactView.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var inputImage: UIImage?
    @ObservedObject var vm: ContactsViewModel
    
    @State private var textName = ""
    @State private var showingPicker = false
    
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
                        
                        Image(uiImage: inputImage ?? UIImage())
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 500, maxHeight: 400)
                    }
                    .onTapGesture {
                        showingPicker = true
                    }
                    .scaledToFill()
                }
                
                Section("Name") {
                    TextField("name", text: $textName)
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
            .sheet(isPresented: $showingPicker) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    func addContact() {
//        guard let inputImage = self.inputImage else { return }
        guard self.inputImage != nil else { return }
        guard textName != "" else { return }
        
        let newContact = Contact(name: textName)
        vm.addContact(contact: newContact)
        
        dismiss()
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(vm: ContactsViewModel())
    }
}
