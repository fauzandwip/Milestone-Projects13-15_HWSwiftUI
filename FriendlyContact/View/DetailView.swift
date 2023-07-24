//
//  DetailView.swift
//  FriendlyContact
//
//  Created by Fauzan Dwi Prasetyo on 16/07/23.
//

import MapKit
import SwiftUI

struct DetailView: View {
    var contact: Contact
    
    @State private var pickerTab = 0
    
    var body: some View {
        VStack {
            if let coordinate = contact.coordinate {
                Picker("", selection: $pickerTab) {
                    Text("Photo").tag(0)
                    Text("Location").tag(1)
                }
                .pickerStyle(.segmented)
                
                if pickerTab == 0 {
                    contact.image
                        .resizable()
                        .scaledToFill()
                } else {
                    Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))),
                        annotationItems: [contact]) { _ in
                        MapMarker(coordinate: coordinate)
                    }
                }
            } else {
                contact.image
                    .resizable()
                    .scaledToFill()
            }
        }
        .navigationTitle(contact.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(contact: Contact(name: "Albert"))
    }
}
