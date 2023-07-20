//
//  Contact.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import SwiftUI

struct Contact: Identifiable, Codable {
    var id = UUID()
    var name: String
    var imagePath: String?
    
    var image: Image {
        if let data = ImageUtils().getImage(imagePath: imagePath) {
            if let uiImage = UIImage(data: data) {
                return Image(uiImage: uiImage)
            }
        }
        return Image("")
    }
}
