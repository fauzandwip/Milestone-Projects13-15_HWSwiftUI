//
//  ContentView.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContactsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.contacts) { contact in
                    NavigationLink {
                        DetailView(image: getImage(contact: contact), contactName: contact.name)
                    } label: {
                        HStack {
                            getImage(contact: contact)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(30)
                            Text(contact.name)
                                .font(.headline)
                        }
                    }
                    .padding(.trailing)
                    .background(.teal.opacity(0.5))
                    .cornerRadius(30)
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Friendly Contacts")
            .toolbar {
                Button {
                    vm.showingAddContact = true
                } label: {
                    Image(systemName: "plus")
                }
                .foregroundColor(.black)
            }
            .sheet(isPresented: $vm.showingAddContact) {
                AddContactView(contactsVM: vm)
                    .environmentObject(vm)
            }
        }
    }
    
    func getImage(contact: Contact) -> Image {
        if let data = ImageUtils().getImage(imagePath: contact.imagePath) {
            if let uiImage = UIImage(data: data) {
                return Image(uiImage: uiImage)
            }
        }
        
        return Image("")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
