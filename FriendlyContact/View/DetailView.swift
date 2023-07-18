//
//  DetailView.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

struct DetailView: View {
    var image: Image
    var contactName: String
    
    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFill()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(contactName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: Image("Albert"), contactName: "Albert")
    }
}
