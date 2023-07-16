//
//  ContentView.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

struct ContentView: View {
    private let contacts = [
        "Albert", "Austin", "Wilkins", "Erik", "Ian Dole", "Irene", "Joseph Gonzalez", "Ludovic", "Sherina", "Heftiba"
    ]
    
    var body: some View {
        NavigationView {
            List(contacts, id: \.self) { contact in
                NavigationLink {
                    DetailView(imageName: contact)
                } label: {
                    HStack {
                        Image(contact)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .cornerRadius(30)
                        Text(contact)
                            .font(.headline)
                    }
                }
                .padding(.trailing)
                .background(.teal.opacity(0.5))
                .cornerRadius(30)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Friendly Contacts")
            .toolbar {
                Image(systemName: "plus")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
