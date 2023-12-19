//
//  TabbedItems.swift
//  BookingApp
//
//  Created by Julian on 19.12.23.
//

import Foundation

enum TabbedItems: Int, CaseIterable {
    case discover = 0
    case favorites
    case bookings
    case messages
    
    var title: String {
        switch self {
        case .discover:
            return "Discover"
        case .favorites:
            return "Favorites"
        case .bookings:
            return "Bookings"
        case .messages:
            return "Messages"
        }
    }
    
    var iconName: String {
        switch self {
        case .discover:
            return "safari"
        case .favorites:
            return "heart"
        case .bookings:
            return "book.closed"
        case .messages:
            return "message"
        }
    }
}
