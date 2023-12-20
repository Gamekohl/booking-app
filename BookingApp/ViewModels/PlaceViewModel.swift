//
//  PlaceViewModel.swift
//  BookingApp
//
//  Created by Julian on 20.12.23.
//

import SwiftUI

class PlaceViewModel: ObservableObject {
    @Published var places: [Place] = [
        Place(image: "https://plus.unsplash.com/premium_photo-1680100256112-2e1231d9d0df?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", title: "Tiny house in Roelingen", amenities: "4 guests • 2 bedrooms • 2 beds • 1 bathroom", pricePerNight: 91, hasDiscount: false),
        Place(image: "https://plus.unsplash.com/premium_photo-1680100256112-2e1231d9d0df?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", title: "Cozy hideout in the middle of Stockholm", amenities: "2 guests • 1 bedroom • 1 bed • 1 bathroom", pricePerNight: 245, hasDiscount: true)]
}
