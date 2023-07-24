//
//  AddContactView.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm: AddContactViewModel
    
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
                
                Group {
                    Section("Location") {
                        Toggle("With location?", isOn: $vm.locationSwitchOn)
                            .onChange(of: vm.locationSwitchOn) { newValue in
                                if newValue {
                                    vm.locationFetcher.start()
                                } else {
                                    vm.location = nil
                                }
                            }
                        
                        // add location
                        if vm.locationSwitchOn {
                            Button {
                                vm.location = vm.locationFetcher.lastKnownLocation
                                vm.locationRecord = true
                                vm.showingAlertLocation = true
                            } label: {
                                Label("Share My Current Location", systemImage: "location.viewfinder")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Add Contact")
            .navigationBarTitleDisplayMode(.inline)
            // add button
            .toolbar {
                Button {
                    vm.isFilled()
                } label: {
                    Text("Save")
                        .font(.headline)
                }
            }
            // image picker
            .sheet(isPresented: $vm.showingPicker) {
                ImagePicker(image: $vm.inputImage)
            }
            // save location alert
            .alert("Location saved!", isPresented: $vm.showingAlertLocation) {
                Button("OK") {}
            } message: {
                Text("Your location will be displayed in detail contact.")
            }
            // saving alert
            .alert("Please", isPresented: $vm.showingAlert) {
                if vm.inputImage != nil && vm.textName != "" {
                    Button("OK") {
                        vm.addContact()
                        dismiss()
                    }
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text(vm.alertMessage)
            }
        }
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(contactsVM: ContactsViewModel())
    }
}
