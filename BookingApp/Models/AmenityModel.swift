//
//  Chip.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import Foundation

struct AmenityModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let image: String
}

var staticAmenities: [AmenityModel] = [
    AmenityModel(title: "Wi-Fi", image: "wifi"),
    AmenityModel(title: "65\" HDTV", image: "tv"),
    AmenityModel(title: "Indoor fireplace", image: "fireplace"),
    AmenityModel(title: "Hair dryer", image: "fan"),
    AmenityModel(title: "Washing machine", image: "washer"),
    AmenityModel(title: "Dryer", image: "dryer"),
    AmenityModel(title: "Refrigerator", image: "refrigerator"),
    AmenityModel(title: "Dishwasher", image: "dishwasher"),
]
