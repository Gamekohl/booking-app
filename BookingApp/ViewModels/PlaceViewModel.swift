//
//  PlaceViewModel.swift
//  BookingApp
//
//  Created by Julian on 20.12.23.
//

import SwiftUI

class PlaceViewModel: ObservableObject {
    @Published var places: [Place] = [
        Place(image: "https://source.unsplash.com/random/?apartment", title: "Tiny house in Roelingen", amenities: "4 guests • 2 bedrooms • 2 beds • 1 bathroom", pricePerNight: 91, hasDiscount: false),
        Place(image: "https://source.unsplash.com/random/?apartment", title: "Cozy hideout in the middle of Stockholm", amenities: "2 guests • 1 bedroom • 1 bed • 1 bathroom", pricePerNight: 245, hasDiscount: true)]
}
