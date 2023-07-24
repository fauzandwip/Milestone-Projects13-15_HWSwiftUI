//
//  Contact.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import CoreLocation
import SwiftUI

struct Contact: Identifiable, Codable, Comparable {
    var id = UUID()
    var name: String
    var imagePath: String?
    var locationRecord: Bool = false
    var latitude: Double = 0
    var longitude: Double = 0
    
    var image: Image {
        if let data = ImageUtils().getImage(imagePath: imagePath) {
            if let uiImage = UIImage(data: data) {
                return Image(uiImage: uiImage)
            }
        }
        return Image("")
    }
    
    var coordinate: CLLocationCoordinate2D? {
        guard locationRecord else { return nil }
        
        return .init(latitude: latitude, longitude: longitude)
    }
    
    static func <(lhs: Contact, rhs: Contact) -> Bool {
        lhs.name < rhs.name
    }
}
