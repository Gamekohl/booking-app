//
//  Favorites.swift
//  BookingApp
//
//  Created by Julian on 21.12.23.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Spacer()
                
                Text("You don't have favorites yet.")
                    .font(.title2)
                    .foregroundStyle(.gray.opacity(0.7))
                
                Spacer()
            }
            .navigationTitle("Favorites")
            .modifier(SlideInModifier())
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    Favorites()
}
