//
//  DetailView.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

struct DetailView: View {
    var imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(imageName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imageName: "Albert")
    }
}
