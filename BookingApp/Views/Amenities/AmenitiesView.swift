//
//  AmenitiesView.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import SwiftUI

struct AmenitiesView: View {
    @Environment(\.dismiss) var dismiss
    
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
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.small)
                        .foregroundStyle(.black)
                        .frame(width: 32, height: 32)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
            }
        }
        .toolbarBackground(.hidden)
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
