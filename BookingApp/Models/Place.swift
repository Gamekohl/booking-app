//
//  Place.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import Foundation

struct Place: Identifiable, Equatable {
    var id: String = UUID().uuidString
    let image: String
    let title: String
    let amenities: String // for now we stick to string
    let pricePerNight: Double
    let hasDiscount: Bool
}
