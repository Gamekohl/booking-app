//
//  AmenitiesView.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import SwiftUI

struct AmenitiesView: View {
    @State var amenities: [AmenityModel]
    
    var body: some View {
        List {
            ForEach(amenities, id: \.self) { amenity in
                HStack {
                    Image(systemName: amenity.image)
                    Spacer()
                        .frame(width: 16)
                    Text(amenity.title)
                }
            }
        }
            .listRowInsets(.none)
            .navigationTitle("Amenities")
    }
}

#Preview {
    AmenitiesView(amenities: [
        AmenityModel(title: "Wi-Fi", image: "wifi"),
        AmenityModel(title: "65\" HDTV", image: "tv"),
    ])
}
