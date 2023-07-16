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
                    vm.showingAddContact = true
                } label: {
                    Image(systemName: "plus")
                }
                .foregroundColor(.black)
            }
            .sheet(isPresented: $vm.showingAddContact) {
                AddContactView()
                    .environmentObject(vm)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
