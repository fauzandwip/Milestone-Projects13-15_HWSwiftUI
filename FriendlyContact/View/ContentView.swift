//
//  ContentView.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

struct ContentView: View {
    private let contactsDummy = [
        "Albert", "Austin", "Wilkins", "Erik", "Ian Dole", "Irene", "Joseph Gonzalez", "Ludovic", "Sherina", "Heftiba"
    ]
    
    @StateObject var vm = ContactsViewModel()
    @State private var showingAddContact = false
    @State private var showingPicker = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.contacts) { contact in
                    NavigationLink {
                        // dummy
                        DetailView(imageName: "Albert")
                    } label: {
                        HStack {
                            // dummy
                            Image("Albert")
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
                    showingAddContact = true
                    print(vm.contacts.count)
                } label: {
                    Image(systemName: "plus")
                }
                .foregroundColor(.black)
            }
            .sheet(isPresented: $showingAddContact) {
                AddContactView(vm: vm)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
