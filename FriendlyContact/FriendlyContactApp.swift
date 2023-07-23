//
//  FriendlyContactApp.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

@main
struct FriendlyContactApp: App {
    private var viewModel: ContactsViewModel = FileContacts()
//    private var viewModel: ContactsViewModel = ContactsCoreData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(vm: viewModel)
        }
    }
}
